#include "WavetableOscillator.h"
#include <cmath>
#include "JuceHeader.h"

// Initialization of oscillator object
WavetableOscillator::WavetableOscillator(std::vector<float> waveTable, double sampleRate)
: waveTable{ std::move(waveTable) },
sampleRate{ sampleRate }
{

}

// Sets frequency of note specified by user
void WavetableOscillator::setFrequency(float frequency)
{
    indexIncrement = frequency * static_cast<float>(waveTable.size()) / static_cast<float>(sampleRate);
}

// Gets sample via linear interpolation
float WavetableOscillator::getSample()
{
    index = std::fmod(index, static_cast<float>(waveTable.size()));
    const auto sample = interpolateLinearly();
    index += indexIncrement;
    return sample;
}

// Calculates linear interpolation
float WavetableOscillator::interpolateLinearly() const
{
    const auto truncatedIndex = static_cast<int>(index);
    const auto nextIndex = (truncatedIndex + 1) % static_cast<int>(waveTable.size());

    const auto nextIndexWeight = index - static_cast<float>(truncatedIndex);
    const auto truncatedIndexWeight = 1.f - nextIndexWeight;

    return truncatedIndexWeight * waveTable[truncatedIndex] +
        nextIndexWeight * waveTable[nextIndex];
}

// Stops the oscillator
void WavetableOscillator::stop()
{
    index = 0.f;
    indexIncrement = 0.f;
}

// Checks if oscillator is playing
bool WavetableOscillator::isPlaying() const
{
    return indexIncrement != 0.f;
}
