use_bpm 55

amp_piano = 0.5

#defining piano
amp_piano = 0.5
define :bmin do
  use_synth :piano
  play :b3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :d3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.5, amp: amp_piano
  play :fs3, attack: 0.06, sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
  play :b4, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.7, amp: amp_piano
  play :d4, attack: 0.06, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :fs4, attack: 0.04,  sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
end

define :gmaj do
  use_synth :piano
  play :g3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :b3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.5, amp: amp_piano
  play :d3, attack: 0.06, sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
  play :g4, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.7, amp: amp_piano
  play :b4, attack: 0.06, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :d4, attack: 0.04,  sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
end

define :emin do
  use_synth :piano
  play :e3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :g3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.5, amp: amp_piano
  play :b3, attack: 0.06, sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
  play :e4, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.7, amp: amp_piano
  play :g4, attack: 0.06, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :b4, attack: 0.04,  sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
end

define :dmaj do
  use_synth :piano
  play :d3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :fs3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.5, amp: amp_piano
  play :a3, attack: 0.06, sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
  play :d4, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.7, amp: amp_piano
  play :fs4, attack: 0.06, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :a4, attack: 0.04,  sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
end

define :amaj do
  use_synth :piano
  play :a3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :cs3, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.5, amp: amp_piano
  play :e3, attack: 0.06, sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
  play :a4, attack: 0.04, sustain: 1, decay: 0.25, sustain: 1.7, amp: amp_piano
  play :cs4, attack: 0.06, sustain: 1, decay: 0.25, sustain: 1, amp: amp_piano
  play :e4, attack: 0.04,  sustain: 1, decay: 0.5, sustain: 0.5, amp: amp_piano
end

#define drums
define :kick do
  sample :drum_bass_hard
end

define :snare do
  with_fx :reverb do
    sample :drum_snare_soft, amp:1.2, pan: -0.2
  end
end

define :hihat1 do
  sample :drum_cymbal_closed, amp: 0.8, pan: -0.6
end
define :hihat2 do
  sample :drum_cymbal_soft, amp: 0.8, pan: 0.4
end

define :crash1 do
  sample :drum_cymbal_open, amp: 0.6, pan: 0.5
end

define :crash2 do
  sample :drum_cymbal_open, amp: 0.5, pan: -0.8
end

define :kick2 do
  sample :drum_bass_soft
end

#define notes and parameters for generative melody
gmajn = [:g3, :b3, :d4, :g4, :b4, :d4, :g5, :b5]
bminn = [:B3, :d3, :fs4, :b4, :d4, :fs4, :b5, :d5]
dmajn = [:d3, :Fs3, :a4, :A4, :d4, :Fs4, :D5, :A5]
amajn = [:A3, :E3, :cs4, :a4, :e4, :cs4, :a5, :e5]

pedal = ring(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0)
sust = 0.75



#piano and ambience
in_thread do
  use_synth :hollow
  with_fx :reverb, mix: 0.5 do
    with_fx :panslicer, phase: 8, wave: 2, invert_wave: 1 do
      3.times do
        play :b4, attack: 6, release: 6
        sleep 8
        
        play :G4, attack: 4, release: 3
        sleep 4
        
        play :d4, attack: 5, release: 3
        sleep 4
      end
      play :b4, attack: 3, release: 6
      sleep 20
    end
  end
  
  with_fx :reverb, mix:0.5 do
    4.times do
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      emin
      sleep 1
      emin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
    end
    2.times do
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
    end
  end
  
  with_fx :reverb, mix:0.5 do
    2.times do
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      emin
      sleep 1
      emin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
      bmin
      sleep 1
    end
    4.times do
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      amaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      gmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
      dmaj
      sleep 1
    end
  end
end


#DRUMS
in_thread do
  sleep 28
  6.times do
    sleep 3.75
    sample :bd_haus
    sleep 0.25
    sample :bd_haus
  end
  
  13.times do
    kick
    sleep 1
    snare
    sleep 0.85
    kick2
    sleep 0.15
    kick
    sleep 1
    snare
    sleep 1
    kick
    sleep 1
    snare
    sleep 0.85
    kick2
    sleep 0.35
    kick2
    sleep 0.15
    kick
    sleep 0.65
    snare
    sleep 1
    kick
    sleep 1
    snare
    sleep 0.85
    kick2
    sleep 0.15
    kick
    sleep 1
    snare
    sleep 1
    kick
    sleep 1
    snare
    sleep 0.85
    kick2
    sleep 0.15
    kick
    sleep 0.85
    kick2
    sleep 0.15
    snare
    crash1
    sleep 1
  end
end

in_thread do
  sleep 52
  5.times do
    
    4.times do
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
      hihat1
      sleep 0.5
    end
  end
  2.times do
    4.times do
      crash2
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
    end
    
  end
  sleep 32
  2.times do
    4.times do
      crash2
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
      hihat2
      sleep 0.5
    end
  end
end


#BASS
in_thread do
  with_fx :reverb do
    use_synth :sine
    sleep 68
    4.times do
      play :b2, attack:0, release:1, sustain:0.6
      sleep 1.85
      play :b2, attack:0, release:0.14
      sleep 0.15
      play :b2, attack:0, release:1.7
      sleep 2
      play :d3, attack:0, release:1.7
      sleep 1.85
      play :d2, attack:0, release:0.3, decay: 0.04
      sleep 0.35
      play :d2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :d3, attack:0, release:1.5
      sleep 1.65
      play :g2, attack:0, release:1.5
      sleep 1.85
      play :g2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :e3, attack:0, release:1.7
      sleep 2
      play :b2, attack:0, release:1.7
      sleep 1.85
      play :b2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :b2, attack:0, release:1 , sustain: 1
      sleep 2
    end
    2.times do
      play :d2, attack:0, release:1, sustain:0.6
      sleep 1.85
      play :d2, attack:0, release:0.14
      sleep 0.15
      play :d2, attack:0, release:1.7
      sleep 2
      play :a2, attack:0, release:1.7
      sleep 1.85
      play :a2, attack:0, release:0.3, decay: 0.04
      sleep 0.35
      play :a2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :a2, attack:0, release:1.5
      sleep 1.65
      play :g2, attack:0, release:1.5
      sleep 1.85
      play :g2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :g2, attack:0, release:1.7
      sleep 2
      play :d2, attack:0, release:1.7
      sleep 1.85
      play :d2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :d2, attack:0, release:1 , sustain: 1
      sleep 2
    end
    2.times do
      play :b2, attack:0, release:1, sustain:0.6
      sleep 1.85
      play :b2, attack:0, release:0.14
      sleep 0.15
      play :b2, attack:0, release:1.7
      sleep 2
      play :d3, attack:0, release:1.7
      sleep 1.85
      play :d2, attack:0, release:0.3, decay: 0.04
      sleep 0.35
      play :d2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :d3, attack:0, release:1.5
      sleep 1.65
      play :g2, attack:0, release:1.5
      sleep 1.85
      play :g2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :e3, attack:0, release:1.7
      sleep 2
      play :b2, attack:0, release:1.7
      sleep 1.85
      play :b2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :b2, attack:0, release:1 , sustain: 1
      sleep 2
    end
    4.times do
      play :d2, attack:0, release:1, sustain:0.6
      sleep 1.85
      play :d2, attack:0, release:0.14
      sleep 0.15
      play :d2, attack:0, release:1.7
      sleep 2
      play :a2, attack:0, release:1.7
      sleep 1.85
      play :a2, attack:0, release:0.3, decay: 0.04
      sleep 0.35
      play :a2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :a2, attack:0, release:1.5
      sleep 1.65
      play :g2, attack:0, release:1.5
      sleep 1.85
      play :g2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :g2, attack:0, release:1.7
      sleep 2
      play :d2, attack:0, release:1.7
      sleep 1.85
      play :d2, attack:0, release:0.1, decay: 0.04
      sleep 0.15
      play :d2, attack:0, release:1 , sustain: 1
      sleep 2
    end
  end
end


#lead synth
in_thread do
  sleep 132
  8.times do
    with_fx :gverb, amp:0.5 do
      use_synth :blade
      s = play :d3, release: 2, note_slide:0.4, attack: 0.1, sustain: 1
      control s, note: :d4
      sleep 1
      s = play :d4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1
      control s, note: :a4
      sleep 1
      s = play :a4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1
      control s, note: :g4
      sleep 1
      s = play :g4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1
      control s, note: :d4
      sleep 1
    end
  end
  
  
end


in_thread do
  sleep 148
  4.times do
    with_fx :gverb, amp:0.5 do
      use_synth :blade
      s = play :a3, release: 2, note_slide:0.4, attack: 0.1, sustain: 1, pan:-0.8
      control s, note: :a4
      sleep 1
      s = play :a4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1, pan:-0.5
      control s, note: :e4
      sleep 1
      s = play :e4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1, pan:0.1
      control s, note: :d4
      sleep 1
      s = play :d4, release: 2, note_slide:0.4, attack: 0.1, sustain: 1, pan:0.4
      control s, note: :a4
      sleep 1
    end
  end
  
end


in_thread do
  sleep 196
  with_fx :normaliser do
    4.times do
      16.times do
        play dmajn.choose, release: 0.80, sustain: pedal.tick*sust
        sleep 0.25
      end
      16.times do
        play amajn.choose, release: 0.80, sustain: pedal.tick*sust
        sleep 0.25
      end
      16.times do
        play gmajn.choose, release: 0.80, sustain: pedal.tick*sust
        sleep 0.25
      end
      16.times do
        play dmajn.choose, release: 0.80, sustain: pedal.tick*sust
        sleep 0.25
      end
    end
  end
  
end

#END