#include "WavetableSynth.h"

// Used to create the wavetable (sine specific)
std::vector<float> WavetableSynth::generateSineWaveTable()
{
    constexpr auto WAVETABLE_LENGTH = 64;

    std::vector<float> sineWaveTable(WAVETABLE_LENGTH);

    const auto PI = std::atanf(1.f) * 4;

    for (auto i = 0; i < WAVETABLE_LENGTH; ++i)
    {
        sineWaveTable[i] = std::sinf(2 * PI * static_cast<float>(i) / WAVETABLE_LENGTH);
    }

    return sineWaveTable;
}

// Creates oscillators with generated wavetables
void WavetableSynth::initializeOscillators()
{
    oscillators.clear(); // Resets list just in case

    constexpr auto OSCILLATORS_COUNT = 128;

    const auto sineTable = generateSineWaveTable();

    for (auto i = 0; i < OSCILLATORS_COUNT; ++i)
    {
        oscillators.emplace_back(sineTable, sampleRate);
    }

}

// Sets sample rate, creates the oscillator list
void WavetableSynth::prepareToPlay(double sampleRate)
{
    this->sampleRate = sampleRate;

    initializeOscillators();
}

// Essentially just used to process user MIDI input, such as pitch and duration
void WavetableSynth::processBlock(juce::AudioBuffer<float>& buffer,
                                  juce::MidiBuffer& midiMessages)
{
    auto currentSample = 0;

    for (const auto midiMessage : midiMessages)
    {
        const auto midiEvent = midiMessage.getMessage();
        const auto midiEventSample = static_cast<int>(midiEvent.getTimeStamp());

        render(buffer, currentSample, midiEventSample);
        handleMidiEvent(midiEvent);

        currentSample = midiEventSample;
    }

    render(buffer, currentSample, buffer.getNumSamples());
}

// Renders audio to DAC with audio buffers
void WavetableSynth::render(juce::AudioBuffer<float>& buffer,
    int startSample, int endSample)
{
    auto* firstChannel = buffer.getWritePointer(0);

    for (auto& oscillator : oscillators)
    {
        if (oscillator.isPlaying())
        {
            for (auto sample = startSample; sample < endSample; ++sample)
            {
                firstChannel[sample] += oscillator.getSample();
            }
        }
    }

    for (auto channel = 1; channel < buffer.getNumChannels(); ++ channel)
    {
        std::copy(firstChannel +startSample, firstChannel + endSample,
                  buffer.getWritePointer(channel) + startSample);
    }
}

// Gets user MIDI input, specifically NoteOn and NoteOff events, gets pitch
void WavetableSynth::handleMidiEvent(const juce::MidiMessage& midiEvent)
{
    if (midiEvent.isNoteOn())
    {
        const auto oscillatorId = midiEvent.getNoteNumber();
        const auto frequency = midiNoteNumberToFrequency(oscillatorId);
        oscillators[oscillatorId].setFrequency(frequency);
    }
    else if (midiEvent.isNoteOff())
    {
        const auto oscillatorId = midiEvent.getNoteNumber();
        oscillators[oscillatorId].stop();
    }
    else if (midiEvent.isAllNotesOff())
    {
        for (auto& oscillator : oscillators)
        {
            oscillator.stop();
        }
    }
}

// Simply converts MIDI value to a frequency
float WavetableSynth::midiNoteNumberToFrequency(int midiNoteNumber)
{
    constexpr auto A4_FREQUENCY = 440.f;
    constexpr auto A4_NOTE_NUMBER = 69.f;
    constexpr auto SEMITONE_IN_AN_OCTAVE = 12.f;
    return A4_FREQUENCY * std::powf(2, (static_cast<float>(midiNoteNumber) - A4_NOTE_NUMBER) / SEMITONE_IN_AN_OCTAVE);
}
