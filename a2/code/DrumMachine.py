import pygame
from pygame import mixer

pygame.init()

# Window size
width = 1400
height = 800

# Initialize colours with RGB values
black = (0, 0, 0)
white = (255, 255, 255)
grey = (128, 128, 128)
dark_grey = (50, 50, 50)
offwhite = (232, 220, 220)
red = (200, 15, 8)
blue = (0, 255, 255)

# Set screen and fonts
screen = pygame.display.set_mode([width, height])
pygame.display.set_caption('Drum Machine')
label_font = pygame.font.Font('freesansbold.ttf', 30)
med_font = pygame.font.Font('freesansbold.ttf', 22)

# Initialize all other variables
fps = 60
clock = pygame.time.Clock()
beats = 8
rows = 6
boxes = []
clicked = [[-1 for _ in range(beats)] for _ in range(rows)]
active_channels = [1 for _ in range(rows)]
bpm = 200
playing = True
active_length = 0
active_beat = 0
beat_changed = True

# Samples
hi_hat = mixer.Sound('Samples/ClosedHH_Cosmic.wav')
snare = mixer.Sound('Samples/Snare_Cosmic.wav')
bass = mixer.Sound('Samples/Kick_Cosmic.wav')
crash = mixer.Sound('Samples/Crash_Electribe.wav')
clap = mixer.Sound('Samples/Clap_Cosmic.wav')
tom = mixer.Sound('Samples/Tom_Suspended.wav')
pygame.mixer.set_num_channels(rows * 3)

# If square is "lit up" and channel is active, sample is played
def play_samples():
    for i in range(len(clicked)):
        if clicked[i][active_beat] == 1 and active_channels[i] == 1:
            if i == 0:
                hi_hat.play()
            if i == 1:
                snare.play()
            if i == 2:
                bass.play()
            if i == 3:
                crash.play()
            if i == 4:
                clap.play()
            if i == 5:
                tom.play()

# Block of code for drawing boxes based on number of instruments and beats per bar
def draw_boxes(clicks, beat, channels):
    left_box = pygame.draw.rect(screen, grey, [0, 0, 200, height - 200], 5)
    bottom_box = pygame.draw.rect(screen, grey, [0, height - 200, width, 200], 5)
    boxes = []
    colours = [grey, white, grey]

    hi_hat_text = label_font.render('Hi-Hat', True, colours[channels[0]])
    screen.blit(hi_hat_text, (30, 30))
    snare_text = label_font.render('Snare', True, colours[channels[1]])
    screen.blit(snare_text, (30, 130))
    bass_text = label_font.render('Bass', True, colours[channels[2]])
    screen.blit(bass_text, (30, 230))
    crash_text = label_font.render('Crash', True, colours[channels[3]])
    screen.blit(crash_text, (30, 330))
    clap_text = label_font.render('Clap', True, colours[channels[4]])
    screen.blit(clap_text, (30, 430))
    tom_text = label_font.render('Tom', True, colours[channels[5]])
    screen.blit(tom_text, (30, 530))

    for i in range(rows + 1):
        pygame.draw.line(screen, grey, (0, i * 100), (200, i * 100), 3)

    # Set colours depeneding on state of box / instrument
    for i in range(beats):
        for j in range(rows):
            if clicks[j][i] == -1:
                colour = grey
            else:
                if channels[j] == 1:
                    colour = offwhite
                else:
                    colour = dark_grey
            rect = pygame.draw.rect(screen, colour, [i * ((width - 200) // beats) + 205, (j * 100) + 5, ((width - 200) // beats) - 10, ((height - 200) // rows) - 10], 0, 3)
            rect = pygame.draw.rect(screen, red, [i * ((width - 200) // beats) + 200, (j * 100), ((width - 200) // beats), ((height - 200) // rows)], 5, 5)
            rect = pygame.draw.rect(screen, black, [i * ((width - 200) // beats) + 200, (j * 100), ((width - 200) // beats), ((height - 200) // rows)], 2, 5)
            boxes.append((rect, (i, j)))

        # Draws moving blue box
        active = pygame.draw.rect(screen, blue, [beat * ((width - 200) // beats) + 200, 0, ((width - 200) // beats), rows * 100], 5, 3)

    return boxes

running = True
while running:
    clock.tick(fps)
    screen.fill(black)

    boxes = draw_boxes(clicked, active_beat, active_channels)

    # Menu buttons
    play_pause = pygame.draw.rect(screen, grey, [50, height - 150, 200, 100], 0, 5)
    play_text = label_font.render('Play/Pause', True, white)
    screen.blit(play_text, (70, height - 135))

    # Switches text depending on if playing or not
    if playing:
        play_text_status = med_font.render('Playing', True, dark_grey)
    else:
        play_text_status = med_font.render('Paused', True, dark_grey)
    screen.blit(play_text_status, (110, height - 95))

    # Bpm buttons
    bpm_space = pygame.draw.rect(screen, grey, [380, height - 150, 200, 100], 5, 5)
    bpm_text = med_font.render('Beats Per Minute', True, white)
    screen.blit(bpm_text, (388, height - 130))
    bpm_text_status = label_font.render(f"{bpm}", True, white)
    screen.blit(bpm_text_status, (450, height - 100))
    bpm_add_button = pygame.draw.rect(screen, grey, [590, height - 150, 48, 48], 0, 5)
    bpm_sub_button = pygame.draw.rect(screen, grey, [590, height - 100, 48, 48], 0, 5)
    add_text = med_font.render('+5', True, white)
    sub_text = med_font.render('-5', True, white)
    screen.blit(add_text, (600, height - 140))
    screen.blit(sub_text, (604, height - 90))

    # Beats buttons
    beats_space = pygame.draw.rect(screen, grey, [765, height - 150, 200, 100], 5, 5)
    beats_text = med_font.render('Beats In Loop', True, white)
    screen.blit(beats_text, (790, height - 130))
    beats_text_status = label_font.render(f"{beats}", True, white)
    screen.blit(beats_text_status, (850, height - 100))
    beats_add_button = pygame.draw.rect(screen, grey, [975, height - 150, 48, 48], 0, 5)
    beats_sub_button = pygame.draw.rect(screen, grey, [975, height - 100, 48, 48], 0, 5)
    beats_add_text = med_font.render('+1', True, white)
    beats_sub_text = med_font.render('-1', True, white)
    screen.blit(beats_add_text, (985, height - 140))
    screen.blit(beats_sub_text, (989, height - 90))

    # Sample toggling buttons
    sample_rects = []
    for i in range(rows):
        collision_box = pygame.rect.Rect((0, i * 100), (200, 100))
        sample_rects.append(collision_box)

    # Clear board button
    clear_button = pygame.draw.rect(screen, grey, [1150, height - 150, 200, 100], 0, 5)
    clear_text = label_font.render('Clear Board', True, white)
    screen.blit(clear_text, (1160, height - 115))

    # Checks if beat is enabled from the box
    if beat_changed:
        play_samples()
        beat_changed = False

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if event.type == pygame.MOUSEBUTTONDOWN:
            for i in range(len(boxes)):
                if boxes[i][0].collidepoint(event.pos):
                    cords = boxes[i][1]
                    clicked[cords[1]][cords[0]] *= -1
        if event.type == pygame.MOUSEBUTTONUP:
            if play_pause.collidepoint(event.pos):
                if playing:
                    playing = False
                elif not playing:
                    playing = True

            # Change bpm via buttons
            elif bpm_add_button.collidepoint(event.pos):
                bpm += 5
            elif bpm_sub_button.collidepoint(event.pos):
                bpm -= 5

            # Change beats per bar via buttons
            elif beats_add_button.collidepoint(event.pos):
                beats += 1
                for i in range(len(clicked)):
                    clicked[i].append(-1)
            elif beats_sub_button.collidepoint(event.pos):
                beats -= 1
                for i in range(len(clicked)):
                    clicked[i].pop(-1)

            # Clear board
            elif clear_button.collidepoint(event.pos):
                clicked = [[-1 for _ in range(beats)] for _ in range(rows)]

            # Toggle channels via clicking
            for i in range(len(sample_rects)):
                if sample_rects[i].collidepoint(event.pos):
                    active_channels[i] *= -1

    # determines length of beat internally from frame rate
    beat_length = fps * 60 // bpm

    # checks what beat is occuring when machine is playing
    if playing:
        if active_length < beat_length:
            active_length += 1
        else:
            active_length = 0
            if active_beat < beats - 1:
                active_beat += 1
                beat_changed = True
            else:
                active_beat = 0
                beat_changed = True

    pygame.display.flip()
pygame.quit()
