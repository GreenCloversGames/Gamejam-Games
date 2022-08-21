
VAR time_left = 60
VAR time_loops = 0

CONTENT WARNINGS!
Depending on the routes gone down, this game may contain descriptions of the following:
Light Nudity, Violence, Car Accidents, Courtrooms, Muggings and Swearing.
Please do not play if you think any of these will have a severe negative impact on you. 
If you feel this list needs updating, please leave a comment on the page. 
*[Start]
#CLEAR
->Start

===Start
~time_loops += 1
~time_left = 60
#AUDIOLOOP: Ambiance_City_Rain_01.wav
+It's exactly 8:59[] and you are SO CLOSE to getting to work on time.
{|Huh, that's weird...|Seems like you'll need to do something to stop this time loop. I'm sure you'll think of something.|}
#CLEAR
You stand at the crossing lights you use everyday.
->CrossTheRoad
===CrossTheRoad
You can see the ally that leads to your shop on the other side of the road.
The road looks quiet.
    +[Dash across]
        You begin to quickly dash across the road.
        ++Suddenly[], you hear the rev of an engine, and the sound of a horn.
        #AUDIO: horn.mp3
        --
        ++[Turn to look]
            #AUDIO: crash.mp3
            You turn to look, and-
            ->TimeRestarts(true)
        ++[Step backward]
            #AUDIO: drive.mp3
            You step backward, and-
            An old man in an open sports car flips you the middle finger as his car barely just misses you.
            Despite the interuption, it's only taken you a few seconds to get across the road.
            ~time_left -= 5
        ++[Jump forward]
            #AUDIO: crash.mp3
            Even though you're running as fast as you can across the road, you try to jump to escape whatever is beeping at you, and-
            ->TimeRestarts(true)
    +[Press the button]
        ~time_left -= 10
        You press the button and wait for the lights to change. 
        ++A car drives past[], seemingly out of nowhere. It's going way over the speed limit.
        --
        #AUDIO: drive.mp3
        Good thing you waited. 
        ++[Cross now]
            You quickly make your way across the road, with nothing unexpected happening. 
        ++[Wait for the beeps]
            ~time_left -= 20
            After about 20 more seconds, the lights bleep, and you make your way across the road. 
            If you hurry, you might still make it!
    +{time_loops > 3}[Screw it, go streaking]
        ->BadEndings.StreakingEnd
-
->StopThief
===StopThief
+You make your way to the other side of the street[] and turn to go into the ally.
-
#CLEAR
{   
    -time_left >= 55:
        ->time_left55
    -time_left >= 45:
        ->time_left45(false)
    -else:
        ->time_leftelse
}    
=time_left55
You see a man and a woman fighting over a backpack near the entrence of the allyway. 
#AUDIO: struggle.mp3
+(help_man)[Help the man]
    You go to the man's side and grab the bag, begining to tug at it with him. 
    It takes a bit of time, but eventually the two of you manage to wrestle the bag from the woman. 
    ~time_left -= 5
    "Thanks!" The man says, before running off with it, our of the alley
    "What the fuck?" The woman says, walking over to you. 
    ~time_left -= 5
    ++"Sorry, I panicked!"
        She lets out a repressed scream, before turning on you again.
        "Well then, it's your turn. Give me your wallet."
        +++[Give her the wallet]
            You quickly get your wallet out and give it to her.
            She opens it and looks inside. 
            "Is this all you got?"
            ++++[Run away]
                ->wallet_run_away
            ++++[Sucker punch her]
                ->punch_her
        +++(wallet_run_away)[Run away]
            You try to run past her, but she trips you up, and you go flying!
            #AUDIO: Body Fall 14.wav
            The last thing you see is the ground rising up to meet you, before-
            ->TimeRestarts(true)
        +++[Suckerpunch her]
            
            You yell as your fist goes flying, but the woman clearly expected this, and dodges it easily.
            ->get_punched
    **(get_punched){time_leftelse}["I know it was his bag."]
        #AUDIO: Heavy Punch 2.wav
        The woman grunts with frustration, and before you even know what's happening, a fist goes flying towards-
        ->TimeRestarts(true)
    ++{get_punched}["I know it was his bag, please don't punch me!"]
        The woman seems shocked by this. You can quickly do something while she's confused.
            +++[Dash past her]
            You quickly make your way past her, and you dash by, before she can do anything. 
            +++(punch_her)[Punch her]
                You quickly run up and sucker punch the woman. She falls to the floor, badly dazed, but still conscious.
                    #AUDIO: Body Fall 18
                ++++[Punch her lights out.]
                    *****->
                        Not wanting her to follow after you, you decide to knock her out properly.
                        However, as you get close to her, her eyes spring open and she sweeps your legs!
                        You fall to the ground with a thud.
                        #AUDIO: Body Fall 14.wav
                        As you lie on the floor, stunned, you can just about make out a shape that looks like a boot, getting bigger and big-
                        ->TimeRestarts(true)
                    +++++->
                        ->BadEndings.KillWomanEnding
                ++++[Rush past her.]
                    You decide to just rush past her, using this distraction to your advantage. 
                    By the time she's regained her senses, you are long gone.
                ---
            +++[Headbutt her]
                You go to headbutt her, and...
                #AUDIO: Game Punch 23.wav
                URGH!
                Fuck, that hurt! You reel back, holding your head in your hands.
                Before you can get your senses back properly, you hear the woman get close to you, and-
                ->TimeRestarts(true)
+(help_woman)[Help the woman]
    You go over to the woman and begin tugging at the bag with her. She gives you the stinkeye, but eventually the two of you manage to wrestle the bag out of the man's hands. 
    "Thanks, kid!" she says, before running out of the alley.
    The man falls to his knees. 
    ++[Run away]
    ++[Ask him if he's OK]
    ++{help_woman > 1}[Try to sneak away]
    --
    As you begin to walk away from the man, he leaps at you{|, {again|for the third time|again?}}
    {|You try to dodge him, but it's no use, his frantic grabbing gets you!}
    "You bastard!" He yells, latching onto your legs, preventing you from getting away. "That was my bag!"
    ++[Punch him]
        You try to punch him, but he's clearly reached a state where nothing seems to phase him!
    ++[Reason with him]
        You try to reason with him, but he's clearly not listening!
    --
    {|||Maybe this isn't the way to go about this...}
    You wrestle with him for a while, trying to get out of his grasp, until...
    ->TimeRestarts(false)
+[Wait for this to blow over]
    You decide to wait for this to blow over.
    As you wait and watch, you see the woman punch the man in the face. This dazes him, and she runs off with the bag, towards you!
    ~time_left = 45
    ->time_left45(true)
=time_left45(waited)
    {not waited:As you get to the opening of an alley, a woman carrying a backpack dashes out!}
    +{time_left45>1}[Trip her]
        ~time_left -= 5
        You know exactly where she's going to step, so you raise your leg to trip her.
        Taken by surprise, she trips, and the bag goes flying!
        #AUDIO: Body Fall 14.wav
        They hit the floor at the same time. The woman lets out a pained yell as she lands.
        --(TL55loop)
        ++[Go to the woman]
            You go towards to woman{, finding out what's wrong with her|even though you already know what's wrong with her}.
            You bend over to get a look at her. Looks like she's {|still} landed on her knees and messed them up. She's not getting up again.
            ~time_left -= 5
            ->TL55loop
        ++[Go to the bag]
            You go towards the bag. The zip has come loose, and you can see what's inside of it.
            It's... Bank notes. A lot, and I mean, a lot, of bank notes.
            +++[Steal the bag and run away.]
                ->BadEndings.StealMoneyEnd
            +++[Bring the bag to the man.]
                ~time_left -= 5
                You take the bag to the man in the alley.
                He's lying on the ground, about to cry.
                But before he can, you dump the bag in front of him.
                ++++[Walk away]
                    You get out of there before the man can react, and you make your way to work.
                    You can hear his confusion, but you are long gone before he can get his thoughts together.
                    ->FinalStretch
                ++++[Tell him you got his bag]
                    He looks up as you tell him you got his bag.
                    He tears up, and hugs you, thanking you over and over again!
                    +++++And he brings you into a hug!
                    -----
                    It's... A long, long hug.
                    Too long.
                    ->TimeRestarts(false)
    +[Ask her if she's OK]
        You ask her if she's OK.
        She ignores you as you pass by.
        ~time_left -= 5
        ->time_leftelse
    +[Let her pass]
        You ignore her as she passes by. 
        ->time_leftelse
=time_leftelse
You walk into the alley, and you spot a man crying!
~time_left -= 10
#AUDIO: crying.mp3
+[Ignore him]
    You ignore him, and make your way to work, hoping that you're not too late.
+[Ask him what's wrong.]
    ~time_left-= 10
    You ask the man what's wrong.
    "She stole it!" He sobs. "She stole my bag! My whole future was in there!"
    ++{time_left<=0}->TimeRestarts(false)
    ++{time_left>0}->
        +++[Ask who stole it]You ask who stole it.
            ~time_left-=5
            "The woman! That bitch!" He spits onto the floor. "She mugged me!"
        ---
        +++{time_left<=0}->TimeRestarts(false)
        +++{time_left>0}->
        ---
        There's not really too much else you can do, so you move on.
-
->FinalStretch

===FinalStretch
+[Finally], you can see the back entrance to the shop in sight, at the other end of the alley.
#CLEAR
-
You only have {time_left} seconds left, so you start sprinting.

+->TimeRestarts(false)
+{time_left>0}You sprint[], and you can feel your legs starting to ache.
    ~time_left -= 5
-

+->TimeRestarts(false)
+{time_left>0}You keep running[], ignoring the sweat falling down your face. 
    ~time_left -= 5
-

+->TimeRestarts(false)
+{time_left>0}You're halfway there,[] you're so close!
    ~time_left -= 5
-
+{time_left>0}->
    ++{TripOnCat}You remember[] the cat that was sleeping on the floor, hidden in the shadows, and you jump over it!
        ~time_left -= 5
    ++{not TripOnCat}You keep running[], when suddendly-
        #AUDIO: Cat meow 2.wav
        ->TripOnCat
+->TimeRestarts(false)
-

+{time_left<=0}->TimeRestarts(false)
+{time_left>0}->
    You finally make it!
-
You rush into the back door of the shop, and your boss is there, looking at his watch.
He glares at you. You can't tell if he's annoyed at how close you were to being late or how if you had been just a few seconds later, he could have fired you.
*[BEEP BEEP BEEP BEEP.]
#CLEAR
#AUDIO: beep beep beep beep.mp3
Your alarm goes off, confirming that you've managed to make it into work before 9. And that seems to have stopped the time loop!
You give your boss a nervous grin, before getting ready for the work day ahead.
-
*[Congratulations!] You managed to get the "good" ending! #CLEAR
-
In this story, if you did anything too wild, like streaking, then the time loop would have ended, and you would have had to live with the consequences of your actions!
As a victory, you can have a look at one of the other endings!
Or, if you want, you can go straight to the ending.
*[What if you went streaking?]
    ->BadEndings.StreakingEnd
*[What if you fought the thief until you knocked her out?]
    ->BadEndings.KillWomanEnding
*[What if you stole the backpack?]
    ->BadEndings.StealMoneyEnd
*[Go straight to the credits.]
    ->BadEndings.Credits
=TripOnCat
What you thought was a shadow is actually a cat! And it's not happy about being trodden on!
It yowls and latches onto your leg, causing you to lose your balance.
You fall to the floor, dazed. Before you can get up-
->TimeRestarts(false)

===TimeRestarts(died)
{died:
    ->Dead
-else:
    ->Alive
}
=Alive
+[BEEP BEEP BEEP BEEP.]
#AUDIO: beep beep beep beep.mp3
#CLEAR
The alarm on your clock goes off. {Shit, it's 9, and you are now late.|Here we go again...}
{Or are you?|}
-
->Start
=Dead
+[Time stops.]
#CLEAR
#AUDIOLOOP: Weird.wav
For a brief moment, you don't exist.
And then, you do again.
->Start

===BadEndings
=KillWomanEnding
#CLEAR
You go towards her, but this time you know what's going to happen, and you hop over her leg!
She growls, but before she can do much more, you hit her with a solid punch.
Yes, you've knocked her out!
*Actually[], it looks like you might have done a bit more than knock her out.
-
*[...]
What's that near her head? Is that... Blood?
VAR call_ambulance = false
-(kweloop)
*[Check her pulse]
    You get on your knees next to the woman, and place your fingers on her neck. 
    Her pulse is very weak.
    ->kweloop
*{kweloop >= 2}[Call an ambulance]
    ~call_ambulance=true
    You take out your phone and call an ambulance. 
    **{time_left != 0}->
        Halfway through your conversation, you hear a beeping from your phone. 
        ***[BEEP BEEP BEEP BEEP.]
        ---
        #AUDIO: beep beep beep beep.mp3

        The alarm on your clock goes off. 
        And you're still on the phone, calling an ambulance for the woman you punched. 
        Shit.
    **->
    --
    You wait for the ambulance to arrive, and it does so fairly shortly.

*[Run away]
    You run the fuck away. You make your way out of the alley, and down the street, hiding out in a bus stop.
    **{time_left != 0}->
        It's OK, remain calm. You try to steady your breathing. 
        You get your phone out, and you see it's nearly 9am. The loop will start again in a bit.
        ***[Any second now...]
            BEEP BEEP BEEP BEEP.
            #AUDIO: beep beep beep beep.mp3
            The alarm on your clock goes off.
            And you're still here. 
            Fuck. 
*[Wait for time to restart]
    You stand there, waiting for time to restart. 
    Any second now... 
    ...
    ~time_left = 0
    **[BEEP BEEP BEEP BEEP.]
    #AUDIO: beep beep beep beep.mp3

    The alarm on your clock goes off.
    --
    You're still standing in the alley, with the bleeding woman in front of you.  
    Shit. 
    ->kweloop

-
*[We jump ahead]
We jump ahead a few weeks, and you are in court. 
#CLEAR
#AUDIOLOOP: court.mp3

You're being charged with Grevious Bodily Harm.
The jury watches CCTV footage from near the scene of the crime.
They watch as you go in to foil a mugging, then sucker punch the woman, before hopping over her leg and punching her in the face. 
*{call_ambulance}->
    Then they watch you calling an ambulance for her. 
    Your defence lawyer talks about you valiently stopping a mugging, and how after defending yourself from the violent thug, 
    She highlights your wonderful and caring heart, how you care even for this criminal, after defending yourself.
*{!call_ambulance}->
    Then they watch you run away. 
    Your defence lawyer highlights the shock that you mush have been in, how you were scared for your life and how you had just saved your life from a violent thug. 
-
You're found innocent, and a local newspaper interviews you about the experience.
She suffers brain damage, and has to learn how to write again.
*[You never see each other again.]
-
->Credits
=StealMoneyEnd
#CLEAR
Fair enough. Who hasn't wanted to steal a bunch of money before!
You take the bag and go running around the corner.
~time_left -= 10
You have {time_left} seconds until the loop restarts.
*(kr)[Keep running]
    This adreneline is amazing! You don't think you could stop running, even if you tried!
    You run down the street, shoving bypassers out of your way, as you think about all the stuff that money could buy!
    **[Games!]
    **[Drugs!]
    **[A car!]
    --
    Of course, you're not going to get a chance to, as you know your alarm is going to go off, and time is going to loop again.
    Almost on queue, you hear it.
*(gom)[Give out the money to people]
    {You take a wad of cash out of the bag and begin making your way down the street, handing it out to people.|You feel a bit bad, considering how time will loop again soon, but at least it makes them happy for now.|}
    **The old lady[], you give her a few notes and she cries out in surprise and delight!
    **The kid skateboarding[], who gives a very enthusiastic "Fuck yeah!" before skating off. 
    **The couple with the kid[], when they're given the money, they just stand in place in shock. 
    **The homeless man[], who actually starts crying as he realises he can afford a place to stay. 
    --
    ~time_left -= 15
    {time_left < 0:But it can't last forever, and...|->gom}

*(sim)[Shower in the money]
    Who hasn't wanted to do this at some point? And if time is going to loop anyway...
    You raise the bag over your head and pull the zip open, throwing it into the sky as you do so!
    There was so much money in there. Bank notes are falling slowly in the air like snowflakes. 
    You laugh as it falls, and you even do a little dance!
    Cars are stopping and a small crowd is forming, as people try to grab the money out of the air.
    In all the noise, you're nearly don't hear it. 
-
*[BEEP BEEP BEEP BEEP.]
#AUDIO: beep beep beep beep.mp3

Your alarm goes off. 
-
*{kr}->
    And you're still running. With a bag full of stolen money. That you took in broad daylight. 
    Shit.
*{gom}->
    And you're still giving out stolen money in broad daylight, and a lot of people are starting to stare at you. 
    Shit...
*{sim}->
    And you're dancing in a shower of stolen money. In broad daylight.
    Shit.
-
*[We jump ahead]
#CLEAR
#AUDIOLOOP: court.mp3
We jump ahead to a few weeks later, and you are in court.

-
Turns out the woman had no idea what was in it, it was just a simple mugging. 
And the man? He was buying a new house in cash, and had just been in the wrong place at the wrong time.
The jury watches CCTV footage of you tripping the woman over and running off with the bag.
*{kr}->
    They see how you just keep on running, and how you don't stop, until you run out of breath. Clearly a sign of guilt.
*{gom}->
    They see you almost immediately taking the money out and handing it out to random people. It's... Really strange behaviour.
*{sim}->
    They see you immediately throwing the money into the air and the pure chaos that errupts.
-
To no surprise, you're found guilty. 
You spend the next six months in prison.
And it should go without saying, you were fired.
*[Stupid time loop...]
->Credits
=StreakingEnd
#CLEAR
Screw it. You're stuck in a time loop, may as well take advantage of it, right?
You quickly rip of your uniform and go running!
    *It feels terrifying![]
        You can feel so many eyes staring at you as you go running. 
        A few people scream, but mostly people are laughing. 
        You can't wait for your alarm to go of and for time to loop again. 
    *It feels amazing![] 
-       Holy shit, it feels so good! You can feel people looking at you and laughing, but you don't care!
        The freedom you have is amazing! It's almost a shame that your alarm is going to go off soon and end all of this...
-
Just then, you hear it.
*[BEEP BEEP BEEP BEEP.]
#AUDIO: beep beep beep beep.mp3
-
The alarm goes off, and...
Time hasn't reset.
You're still standing there, in the middle of the street. Naked.
*[We jump ahead]
#CLEAR
#AUDIOLOOP: court.mp3
-
We jump ahead a few weeks, and you are, unsurprisingly, in court.
You're being tried for public nudity.
The jurors watch the CCTV footage of standing at the crossing, before suddenly stripping down and running around.
It's an open and shut case. You are found guilty and made to pay a hefty fine. 
You're also put onto a sex offenders register.
It should go without saying, you were fired from your job as well.
*[Stupid timeloops...]
    #CLEAR
    ->Credits

->Credits
=Credits
#CLEAR
Thank you for playing the game!
If you want to say which ending you got, you can fill in a quick form here! 
*[Yes please!]
    #LINKOPEN: https:/\/forms.gle/W5m1BqyTFuM5S18RA
*[No thank you!]
-
Also, credits:

City ambiance, Fighting, Cat meor and the "Death" reset audio sound effects come from Sidearm Studios
Other sound effects come from ZapSplat
Thanks again for playing!
->END