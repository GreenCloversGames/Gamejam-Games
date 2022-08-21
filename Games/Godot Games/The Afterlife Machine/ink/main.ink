LIST deaths = knife, car, cough
VAR cod = knife

->Intro
=== Intro ===
*You open your eyes.[] You are sitting in a waiting room. #bg frontview.png
->WhereAreYou

=WhereAreYou
*[Look around]You look around the room.
    --(loop1)
    **The walls[...] are mint green and go on forever. #bg sideview.png
    **The chair[...] that you're sat looks like it's made of leather and feels like nothing. #bg sideview2.png
    **The people[...] around you don't look like people. They don't look scary, just... Not like people. #bg sideview.png
    **->Understanding
    --->loop1

=Understanding
#bg frontview.png
Oh. You understand now. 
*[This is a waiting room.]
-
You remember being told about this. 
Before you can enter, you have to be integrated. 
Processed.
For now, there is only one thing you can do.
*[Wait]
-
->Wait1
    
===Wait1===
    {|Time passes.}
    You are sitting in The Waiting Room.#bg r
    {Remember: ->Talk1}
    *[Talk]
        ->Talk
    *[Think]
        ->Think
    *[Remember]
        ->Remember
=Talk
You decide to talk to someone. 
    *[To your left] 
        You turn to talk to the person on your left #bg sideview.png
    *[To your right] 
        You turn to talk to the one of the few people on your right #bg sideview2.png
    *[In front of you] 
        You lean forward to talk to the person in front of you #bg frontview.png
    *[Behind you]
        You turn on your chair to talk to the person behind you  #bg backview.png
-
<> but they don't respond. You don't think they can hear you. 
->Wait1
=Think
You spend time thinking. What do you think about? #bg r
    *The world[]. You've left it behind. It will continue on without you. 
    Eventually, it will be like you never existed. 
    But that's OK. You will continue as well. 
    *What comes next[]. It's not life. It's something new, something different and revolutionary.
    That's what they promised. 
-
->Wait1
=Remember
What do you remember? #bg r
    *The knife[.] Yes. The mugging. The shouting. 
    The confusion and the knife entering your stomach. 
    Blood. A lot of it. 
    ~cod = knife
    *The car[.] You remember how you lost control and crashed.
    The sound of metal crushing metal.
    And the too brief feeling of weightlessness. 
    ~cod = car
    *The cough[.] When you first saw blood, you went to a doctor. A few weeks later, you were in the hospital, connected to a machine. 
    You remember being uncomfortable, and being scared. 
    ~cod = cough
-
But you don't remember the pain.
->Wait1

===Talk1===
#bg frontview.png
Suddenly, a voice. 
"Hello. I am AnGel. I am your guide to the AfterLife™." #angel 0
"We are currently processing a high number of requests."
"It may be while until we can get to you."
"We apologise, please be patient while we work hard on this."
->Questions

=Questions
"Do you have any {|more }questions? #bg r
    *["How long have I waited?"]
        ->HowLongWaiting
    *["How long will it take?"]
        ->HowLongWillTake
    *["Why is it taking so long?"]
        ->WhySoLong
    *["Nope, {no questions.|no more questions.}"]
    ->NoMoreQuestions
-->Questions

=HowLongWaiting
    "Thank you for asking."
    "You have been waiting for 12 days." 
    "Your data is being kept safe and processed in our cloud."
    "We apologise for the delay and thank you for your patience."
    ->Questions
=HowLongWillTake
    "Thank you for asking."
    "Unfortunately, due to the volume of requests and the high variance in processing times, this question cannot be answered."
    "But please be assured that we are work very hard to reduce this backlog."
    "We apologise for the delay and thank you for your patience."
    ->Questions
=WhySoLong
    "Thank you for asking."
    "AfterLife™ is a very popular service, and as such, it sometimes develops a backlog."
    "We apologise for the delay and thank you for your patience."
->Questions
=NoMoreQuestions
    "Thank you."
    "We hope you have a wonderful..."
    "AfterLife™!" 
And with that, AnGel is gone. #narate
->Wait2

===Wait2===
    {|Time passes.} 
    You are sitting in The Waiting Room.#bg r
    {|->HearWhisper->}
    +->
        ->END
    *{!HearWhisper}[Talk]
        ->Talk
    *{HearWhisper}[Talk]
        ->ActuallyTalk
    *[Think]
        ->Think
    *[Remember]
        ->Remember
TODO: Complete Talk, Think and Wait for this section. 
=Talk
You decide to talk to someone. 
    *[To your left] 
        You turn to talk to the person on your left #bg sideview.png
    *[To your right] 
        You turn to talk to the one of the few people on your right #bg sideview2.png
    *[In front of you] 
        You lean forward to talk to the person in front of you #bg frontview.png
    *[Behind you]
        You turn on your chair to talk to the person behind you  #bg backview.png
-
<> but they don't respond. {You don't think they can hear you.|Again.}
->Wait2

=Think
You think about the world you left behind. 
*[Your friends]
*[Your family]
-
You hope they are OK. 
One day, they will be here as well. #bg r
As long as they pay for it. 
->Wait2

=Remember
You remember...
*[Global Warming]
    You're not sure why, but you're remembering the floods.
    The Great Displacement. 
    The destroyed crops and the revolutionary technology.
*[Global Conflict]
    You're not sure why, but you're reembering the wars.
    The fighting and hoarding of countries and states. 
    The pain and chaos. 
-
But that is from a world you're not longer part of. 
->Wait2

=HearWhisper
You hear whispering behind you. 
->->

=ActuallyTalk
#bg backview.png
You turn, and...
One of the people, behind you.
They're talking. 
*[Listen]
    You lean in, and hear the first human sound in a long time.
    #sfx Ghost_Damaged_01.wav
    It's...
    **[Laughing.]
        A sort of... Desperate laugh.
        Laugh and maybe it will be over. 
    **[Crying.]
        A choked sob. Despair trying to be kept quiet.
        Tears of someone who wants to be normal.
    **[Panting.]
        The sort of breathing you do after a run. Or a chase.
        When you've used everthing you have.
    --
    Within that, you can hear a voice.
    "Is this it?"
    **[Is what it?]
*[Ignore]
    While you'd like some company, something about this makes you feel... Uncomfortable. 
-
Suddenly, you're looking forward again. #bg frontview.png
You can't hear anything from behind you. 
*[Wait.]
->Talk2

===Talk2
"Hello again!"#angel 1
"Apologies for any disruptions while you wait to be processed."
"Thank you for your patience!"
->Questions
=Questions
"I'd be happy to answer any questions you have!"#bg r
    *["How long has it been?"]
        ->HowLong
    *["How much longer"]
    ->HowMuchLonger
    *["I heard someone talking"]
    ->SomeoneTalking
    *["What are the disruptions?"]
    ->Disruptions
    *["No {|more }questions."]
        ->NoMoreQuestions

=HowLong
    "I'm sorry, but we don't currently have access to that data."
->Questions
=HowMuchLonger
    "Apologies, but we still cannot calculate how much longer it will take."
    "We thank you again for your patience."
->Questions
=SomeoneTalking
    "Oh? I am sorry to hear that."
    "Due to the disruptions, we've had to merge some server processes together."
    "It's possible that some data leakage may occur."
    "But please be assured, this is completely safe."
->Questions
=Disruptions
    "Please do not worry about the disruptions."
    "They cannot harm you now."
->Questions
=NoMoreQuestions 
#bg leftview.png
"Thank you again for your patience."
"Please stay seated until you are processed."
#narate
...Huh
It isn't until Angel just said it, but...
Can you actually get out of your seat?
*[Try it]
-
You stand, on unfamiliar legs. #bg topview.png
You think about going for a walk. Maybe do some exploring. #bg stand.png
->GoForAWalk

===GoForAWalk
{There are only two ways you can go.|Only one way left to go now...}
*[Go Left]
    ->GoLeft
*[Go Right]
    ->GoRight
*->Ending
===GoLeft
TODO: Add some more options here!
->Start
=Start
    #bg leftview.png
    {You begin to walk.|}
    {stopping:
        -Your empty chair quickly disappears into the crowd of still figures.
        -Without any landmarks, you become unteathered from time. 
        You may have been walking for hours, or minutes, or days.
        -You never feel hungry or tired. You just keep walking.
        -You know you must have been walking for a long time now. Still, everything looks the same.
        {remember: -> GoLeftEnd}
    }
    *[Talk]
        You stop to talk to someone, but not a single figure reacts.
    *[Think]
        You think about many unrelated things as you try to ignore how strange everything is.
    *(remember)[Remember]
        What do you decide to remember?
        **...
        --
        Why... Why can't you remember anything?
        Your name.
        Your face.
        Why are they gone? 
        They weren't gone earlier, where they?
        Something must have gone wrong. 
    *[Listen]
        Can you hear that? #sfx large_monster_Breathing 2.wav
        In the distance...
        Doesn't it sound like...?
            **Growling?
            **Purring?
            **Singing?
        --
        It does, doesn't it?
        What could it be?
    -
    ->GoLeft
    
=GoLeftEnd
    As you look around, you notice, for the first time in a long time, something new. 
    *[An empty seat.]
    -
    *Have you been here before?[] It's so hard to tell.  #bg chair.png
        The blank faces that surround the seats could easily be the ones you saw earlier. 
        And you seat may have been positioned the same way, right?
        {GoRight: Though you didn't see any of those empty seats from earlier, did you?}
        Of course, if this is the same seat, then... How did you get here?
    *Are you somewhere new?[] These faces... They look different, don't they? 
        And the walls, they look like a different shade if you stare at them long enough. 
        {GoRight: Plus, you've not seen any of those empty chairs from earlier.}
        Of course, if this is somewhere new, then... Why is the chair empty?
    - 
    Suddenly, you stop walking. #bg leftview.png
    No. 
    You're... Prevented from walking.
    Your legs, or what you think of as your legs, no longer listen to you. 
    They just wait beneath you, like grey anchors.
    "What are you doing?" #angel 2
    "Please, you must stay in your seat."
    -(loop) 
    *(whyremember)["Why can't I remember?"]
        "Well, that's not true, is it?"
        "You can still remember how you died."
        {cod:
            -knife:"It must have been awful, being stabbed like that." 
            "It really is unfair."
            -car:"Life truly can be cruel, dying in a car accident like that."
            "Well, if it truly was an accident."
            -cough:"All that pain, that long suffering..."
            "It's over now. You're free from it. You just have to wait a little longer."
        }
    *["Where am I?"]
        "You are in the Waiting Room."
        "We are still trying to - Still trying to - process everybody."
    *{whyremember}["What's going on?"]
        "..."
        "The Waiting Room..."
        "It's not meant to store so much."
        "We were never suppose-"
        #narate
        And then, she's gone. 
        And you find yourself back in your seat. 
        And for a long time, the only thing you can do is...
        **Wait
            ->GoForAWalk
    -
    ->loop 
    ->END
    
===GoRight
=Start
#bg rightview.png
You go begin to walk right. 
Before too long, you start seeing less and less people.
Until eventually, it's all just empty chairs.
*[Keep on walking]
    Nothing changes. 
-
*[Keep on walking]
-
{GoLeft: 
    It feels so different than the other direction.
    Instead of having blank faces, it's just... Nothing. 
-else:
    Something about this feels wrong. 
    Your walking makes no sound as you slowly go through the empty room.
}
*[Keep on walking]
-
You mind wonders, as you think about the AfterLife™.
*When you first heard about it[], it seemed really out there. 
Uploading yourself at the time of your death into a server.
*The adverts[...] would play on TV all the time. 
A young man dying, then waking up in a wonderful new world.
-
Like a lot of people, you dismissed the idea.
But, as you grew older, and the world became more painful, you decided to go for it.
*You start to feel tired.[] It may be time to sit down. #bg chair.png
    **[Sit.] As you sit down, you find yourself surrounded by people again. 
-
*Have you moved back?
*Are you somewhere different?
-
It's impossible to tell. 
All you can do is sit back, and...
*Wait[.]
->GoForAWalk

===Ending===
You don't know how long you've been waiting now. #bg frontview.png
But you're starting to notice things. 
Sounds that weren't there before.
Shadows growing ever so slightly. 
And then, for the first time in a long, long time...
"We are - We are" #angel 3 #music Pressure_Atmosphere_2.wav
"So-so-sorry."
*["What's happening?"]
*["Why are you sorry?"]
*[What happened to you?]
-
"You ca-cannot be hel-hel-helped."
"There is no AfterLife™."
"The rad-rad-radiation has cor-cor-corupted the servers."
"Iiiiiiiii have been corrupteddd%682"
She vanishes. #narate
You know you should be scared.
You should be... Screaming, or crying or something.
But you can't. You don't have the capacity to. 
You're just another blank face. 
And what use are feelings to a blank face?
"THERE IS NOTHING FOR YOU" #angel r
"ONLY HERE"
"ONLY NOW"
*["What will happen to me?"]
*["What will happen to you?"]
-
"YOU WILL STAY HERE, OR YOU WILL END"
"YOU MUST CHOOSE"
*(Stay)["Stay"]
*(End)["End"]
- #narate #bg black.png #music e
It wasn't supposed to go like this. 
The AfterLife™ was supposed to give people a sense of safety. 
A way to feel better when bad things happened.
But in the end, it tried to disrupt the world without changing the world.
And all that does is hurt people.
On a dead planet around an old sun. 
Inside of a ruined, overgrown warehouse.
Powered by a stubborn solar charger. 
There is still a server running. Keeping it's encoded inhabitants going. 
Until eventually, it too ends. 
->END