VAR event = "none"
VAR time = 0
VAR stress = 0
VAR kurtstate = "working"
VAR kurtwork = 0
VAR kurtmood = 0
VAR otisstate = "headondesk"
VAR otiswork = 0
VAR otismood = 0
VAR marshellstate = "chatting"
VAR marshellwork = 0
VAR marshellmood = 0
VAR adriennestate = "chatting"
VAR adriennework = 0
VAR adriennemood = 0
VAR pattystate = "working"
VAR pattywork = 0
VAR pattymood = 0
VAR janetstate = "sulking"
VAR janetwork = 0
VAR janetmood = 0

VAR sir = "Sir"
VAR patty = "The girl whose name you can't remember"

VAR instructionsonboard = false
->Intro
===Intro===
#b Heavy Rain 2
#c clear
"Hey. Thanks for helping out today. I'm taking the rest of the class on a school trip." 
    "The kids who you're teaching were 'sick' on the day of frog dissection, so they have to do it now to get their grade."
    "Sorry. It should only be an hour, and it will be done. I've left a seating plan on the desk, along with the instructions for the students. "

    *["I owe you one for this, Sir"]
        ~sir = "Sir"
    *["I owe you one for this, Miss"]
        ~sir = "Miss"
-
That's the note you got this morning. 
You HAD planned to get some marking today, but it seems that will have to wait until for this weekend. 
The bell rings. You move through crowds of students, packed near the exit to the building as they stare at the rain.
*[Wait for them to move]
*[Push students out of the way]
    For a second you consider shoving the boy in front of you out of the way. Then you catch the eye of another teacher and think better of it.
*[Ask the students to move aside]
    They ignore you, too busy talking talking to one another about weekend plans. Just one more period to go...
-
#c Door
Eventually, the students finally brave the rain, and you arrive at the door to the lab.
Outside are 4 students.
-(student_loop)
*[Kurt]
    #c Kurt
    A spotty face with worry lines. You've seen this boy around the school before.
    The last time you saw him, he was freaking out because he had forgotten his locker code.
    ->student_loop
*[Otis]
    #c Otis
    Long greasy hair and a patchy beard. You've never taught him, but you've heard plenty of teachers talk about him.
    You remember hearing a student talk about how he was excluded from his last school for stealing. 
    ->student_loop
*[A girl who's name you can't remember]
    #c Patty
    Rimmed glasses above tired eyes. You have no idea who this girl is, but you think you may have taught her before.
    She seems to recognise you, and makes an expression you can't quite read. 
    ->student_loop
*[Janet]
    #c Janet
    Dyed hair and a pierced nose. You recognise her first. 
    She was the one who threatened to sue the school if they didn't provide vegeterian options in the canteen. 
    ->student_loop
*{CHOICE_COUNT() < 1}[Tell them to go in.]
    You tell the waiting students to go in.
    #c Janet
    "We can't, {sir}." Janet speaks up. "The doors locked."
    Shit.
		#c Door
    You go to the next lab over. A middle-aged teacher is lecturing a bunch of bored looking students. 
    **[Knock on the door]
        You lightly tap on the door. The teacher looks over you while still talking.
        ***(key)[Mime unlocking a door.]
        #a Keys 1
            You mime unlocking a door. The teacher moves to her desk, takes out a key and passes it to you without missing a beat. 
        ***[Mouth "Do you have a key?"]
            You try to mouth your question, but judging by the look on her face, she doesn't understand what you need. 
            ~stress = stress + 1
            ->key
    **[Enter the room]
        You step into the room, raising a hand in apology. The teacher stops talking and says "What do you want, {sir}?"
            ~stress = stress + 1
        ***["Sorry for interupting."]
            She looks annoyed, so you feel the need to apologise. 
            "Sorry for interupting, Miss, but I need a key for next door."
            #a Keys 1
            She gives out a small murmur of annoyance, but she does retrieve the key for you.
        ***["I need a key"]
            No point in apologising. You can tell she's pissed off. You ask for a key.
            #a Keys 1
            She rolls her eyes and retrieves a key from her desk. 
-
You go back to the door, and you see another two students have arrived. 
-(student_loop_2)
*[Marshell]
    #c Marshell
    Buzzcut and a smug expression, this kid is a real piece of work. 
    He seems to know exactly what to say to humiliate student and staff alike. 
    ->student_loop_2
*[Adrienne]
    #c Adrienne
    A blonde ponytail with a heavily made up face. Adrienne wants nothing to do with school.
    You've seen her in the corridors plenty of times, mostly when she's supposed to be in lesson.
    ->student_loop_2
*->StudentsLate
=StudentsLate
*[Ask them why they're late.]
    "Why are you two late?"
    #c Adrienne
    "Um, actually we were here before you, {sir}." Adrienne pipes up. 
    ~stress += 1
    #c Marshell
    Marshell smirks. 
    **[Leave it]
        It's not worth getting into an argument about this. You decide to leave it there. 
    **[Press further]
        There's no way you're letting these two get away with being late to your lesson. 
        "I was here already, I was just getting the key. You two are late."
        This time Marshell pipes up. "We were talking to a teacher." He says it with a smug grin. 
        ***[Let it slide.]
            You're bullshit detector is going off, but you don't feel like arguing in the corridor. 
        ***[Give them detention.]
            ~adriennestate = "absent"
            "Detention, for being late."
            Marshell's expression doesn't change, but Adrienne gives out a loud groan. 
            #c Adrienne
            "Oh my god, fuck this."
            She grabs her bag and begins walking away.
						~stress += 2
            ****[Call her back]
                You try and call after her, but she just flips you the bird without turning around.
            ****[Let her go]
                Whether it's to let her calm down or because you can't be bothered to deal with her, you let her leave. 
*[Ignore the fact they're late]. 
-
#c Door
You unlock the door and enter the lab.
#c Lab
Known by student and staff alike as the "Armpit", this lab is the booby prize of the science department.
No teacher wants to teach in here, with it's lack of heating and terrible ventilation.
The rest of the students slowly make their way in. They don't want to be in here either. 
*[Write the instructions on the board]
    You begin to write the instructions on the board.
    ~instructionsonboard = true
*[Tell everyone the instructions.]
		#c Marshell
    Just before you begin, you see Marshell is about to throw a piece of paper at Otis. 
    **[Stop him.]
        "Don't you dare throw that, Marshell." You warn. 
        Marshell smirks as he pockets the paper ball. 
-"Everybody needs to take a frog and a dissection kit."
"Follow the instructions on the worksheet to cut open your frog."
"Take the organs out and place them on the tray."
"Then describe each organ on the worksheet."
{instructionsonboard: ->OtisInTrouble|->LayingOutFrogs}
=OtisInTrouble
As you turn back around, you see Otis is looking away from you and giving Marshell the finger. 
*[Call him out.]
    #c Otis
    "Otis!" You exclaim. 
    Otis turns around, looking pissed off. 
    "What?" He demands.
    **[Ask him what's wrong.]
        "What's wrong? Let me know and I can help."
        He eyes shift towards Marshell, but he simply grunts "Nothing" and puts his head on the desk. 
        ***[Detention]
            ->OtisDT
        ***[Move on]
            There's no point continuing with this, may as well move on. 
    **(OtisDT)[Detention]
        ~changeClassMood(-5)
        ~marshellmood += 10
        "You've just earned yourself a detention!"
        Otis throws his hands in the air. "What? He started it!" He motions towards Marshell. 
        ***["I don't care."]
            "I don't care who started it, it's unaceptable to treat someone like that."
            Otis looks shocked at this percieved injustice, and kicks the stool next to him. He seems to be sulking now. 
            ~otisstate = "sulking"
            #c Marshell
            Marshell smirks, looking pleased with himself. 
        ***["I'm sorry."]
            From what you know, it's likely that Marshell did do something stupid to deserve being sworn at.
            "I'm sorry, Otis."
            ****["But a rule is a rule."]
                "But a rule is a rule, and you broke it."
                Otis scowls at you. 
                ~otisstate = "sulking"
                #c Marshell
                Marshell smirks, looking pleased with himself. 
            ****[Give him a chance]
                "Work hard today, and you can work it off."
                Otis still looks pissed off, but he finally spits out a "Fine."
*[Ignore him.]
    If you argue about everything wrong someone does in this class, the lesson will never start. At least Otis is swearing quietly.
-
->LayingOutFrogs
=LayingOutFrogs
#c Uncut Frog
You lay out the frogs on the table, lying dead in their trays. 
*[You feel sorry for them.]
    You feel sorry for them, animals grown to die and be chopped up.
*[You don't feel anything for them.]
    You don't feel anything for them. They never really had any lives to lose.
-
#a Metal Tools Foley 1
You take out a tray which contains the scalpels and the pins. The scalpels are placed in small, plastic dips which makes them easy to check. 
There are 10 scalpels, you don't know why you have so many, but you're too tired to organise interupts.
#c Lab
Kurt and {patty} go to get their frog. 
{otisstate == "sulking":<> Otis continues to sulk in his seat.>|With what looks like great effort, Otis pushes himself from his desk and collects his frog.}
{adriennestate != "absent": Adrienne and Marshell stay firmly in their seats, chatting.|Marshell stays in his seat, messing about with paper.}
Janet also stays in her seat. 
*{adriennestate != "absent"}Talk to Adrienne and Marshell
    ->getAMtowork->getJtowork

*{adriennestate == "absent"}Talk to Marshell.#
    ->getMtowork->getJtowork
*(getJtowork)[Talk to Janet]
    You walk over to Janet. 
    #c Janet
    "Janet, you need to get to work."
    "Nope. I'm protesting."
    **[Oh dear lord.]
    **[For fucks sake.]
    --"You need to complete this task for your grade, Janet."
    "Nope. I already know enough about frogs, I don't need to cut one open. And you can't make me do it."
    **(jdet)[Give her a detention]
        You don't have time to deal with this.
        "Detention, Janet."
    **[Don't give her a detention]
        "I'm not going to force you to do anything you don't want to do."
    --
    "That's fine. I'm just going to sue the school anyway."
    Janet leans forwards and begins shouting. "Hey everyone! I'm getting a detention for not cutting open a dead animal!"
    Nobody looks up, except for Marshell who lets out a "Whoo!". 
    {jdet: 
        "I didn't give you a detention though, Janet."
        "I know. But I'll go to it anyway."
    }
    You'll try and deal with this later. For now, you need to get going. 
    {adriennestate!="absent" and not getAMtowork: ->getAMtowork->}
    {adriennestate=="absent" and not getMtowork: ->getMtowork->}
-
->ToMain
=ToMain
    #c Lab
    Finally, it seems that everyone except for Janet is working. Or at least, pretending to work.
    ->Main
=getAMtowork
You walk over to the two as they laugh about something. 
"You need to collect your frogs and your tools."
{getJtowork:
#c Adrienne
Adrienne rolls her eyes. "Come on, {sir}, why do we need to cut open a poor little frog?"
*"Because I said so."
    Adrienne laughs. "Really? Because I don't think I do."
    #c Marshell
    "Yeah, you can't force us, or anything." Marshell butts into the converstaion. 
        **[Threaten them with detention.]
            "If you don't do your work, then you'll get a detention."
            The pair groan, and rise to collect their stuff. They've seen that you've already given Janet a detention. 
            It seems that they'd rather pretend to do their work then waste their time. 
            ~adriennestate = "pretending to work"
            ~marshellstate = "pretending to work"
            ->->
    **[Move on]
        This is an argument you can't be bothered to have, so you decide to move on. 
        If they want to waste their time, it's their choice. 
        ->->
*"For your education."
    Marshell laughs. "Aww, {sir}, I didn't know you cared!"
    #c Adrienne
    "But when are we ever going to know what the insides of a frog look like?" Adrienne asks.
    #c Marshell
    "Yeah, it's not like I've got any plans of being a frog butcher." Marshell chuckles at his own joke. 
        **[Threaten them with detention.]
            "If you don't do your work, then you'll get a detention."
            The pair groan, and rise to collect their stuff. They've seen that you've already given Janet a detention. 
            It seems that they'd rather pretend to do their work then waste their time. 
            ~adriennestate = "pretending to work"
            ~marshellstate = "pretending to work"
        ->->
        **[Move on]
            This is an argument you can't be bothered to have, so you decide to move on. 
            If they want to waste their time, it's their choice. 
            ->->
    -else:
        #c Adrienne
        Adrienne looks towards Janet. "Why are you going to us first? What about her?"
        You look ovet to Janet. She's steadfastly not working. 
        *[Explain you're going to talk to her next.]
            "I'm going to talk to her next. For now, I'm talking to you."
            Adrienne rolls here eyes. "Sure, and I'm sure you chose to talk to us at random."
            #c Marshell
            Marshell butts into the converstation. "You think we're not going to do it, right?"
            **[Agree]
                Might as well be honest with them. 
                "Yeah, I think you two are going to try and slack off."
                Marshell shakes his head and leans back in mock shock. 
                "Well, if you're going to be like that, I think we shouldn't work. Don't you agree?"
                #c Adrienne
                "Absolutely. See you later, {sir}!"
                ***[Give them detention.]
                    "Detention. Both of you."
                    They both groan, but make no effort to move. 
                    You decide to leave them for now. 
                    ->->
                ***[Leave them]
                    Urgh, teenagers. If they want to waste their time, so be it. 
                    ->->
            **[Disagree]
                This feels like a trap. 
                "Of course not, I just want you to work hard."
                The two roll their eyes, but maybe you've actually been able to do something. They both go to get their equipment.
                ->->
        *[Ignore the question]
            They're just trying to distract you. You ignore the question. 
            "You two need to get on with your work."
            Adrienne looks at Marshell, and the two slowly move over to collect their frog and their tools. 
            It seems they think it's better to pretend to work then argue with you. 
            You feel like you've managed to avoid a massive argument. 
            ->->
    }

=getMtowork
    #c Marshell
    Marshell is sitting at his table, messing about with a piece of paper. 
    Is he... He is.
    He's actually making a paper plane. Dear lord, this kid is annoying.
    *[Call him out]
        "Marshell! What are you doing?"
        Marshell smirks. He seems to do that a lot. 
        "I'm making a plane, {sir}."
        **[Ask him why]
            "Why on earth are you doing that?"
            He puts on a face of mock innocence. "Isn't this physics?"
            ***[Play along]
                "No Marshell. It's biology." You motion to the front of the class, where everything is set up. "Hence, the frogs."
                Mock understanding this time. "Ohhhh, that makes sense."
                "Why don't you go get your frog, then?"
                Marshell pauses, then seems to decide to go along with you, standing and moving to collect the tools. 
                You breath a small sigh of relief. That was less painful then it could have been. 
            ***[Don't take his crap]
                "Marshell, you know full well this is biology. Don't pretend to be an idiot."
                Mock outrage this time. "Well, I never, {sir}. I really thought we had physics!"
                "You didn't. Stop wasting time and grab your tools."
                He smirks, but he does rise to take his tools.
            ---->->
        **[Press on]
    *[Ignore it]
        If you call him out on it, he's only going to be more annoying. Best to pretend you haven't seen it.
-"You need to get your tools for the dissection."
He looks at you with mock confusion. "Do I?"
*[Play along]
    "Yes, Marshell. <>
    {instructionsonboard:
        That's what I wrote on the board.
        He looks at you. "Oh, I didn't bring my glasses today, {sir}. I don't think I can do it."
    -else:
        That's what I just said.
        He looks at you. "Oh, sorry {sir}, I must not have heard you. I've been a bit deaf recently."
    }
    **[Offer to explain again]
        "Well Marshell, I can explain again if you need me t-"
        Marshell interupts you. "That's OK, {sir}, I think I can work out what to do."
        He then begins making his way to the front of the class to get the equipment needed.
        Who needs threats when just the thought of having to spend more time with a teacher is threat enough.
    **[Threaten him]
        "Well, Marshell, you better find out what to do, because if you don't you'll have a detention."
        Marhsell sighs, but does slowly make his way over to the equipment. 
*[Threaten]
    You really can't be bothered with this, 
    "Get your tools, Marshell, or I'll give you a detention."
    He sighs, but he does get up to grab his tools, at least. 
-
~marshellstate = "pretending to work"
->->

//MAIN SECTION HERE DUMBASS!
===Main===
~progressTime()
#c Lab
You look around the classroom. 
+{event == "none"}What should you do?
    ~getRandomState()
    **[Help Kurt]
        ->HelpKurt
    **[Check on Otis]
        ->CheckOnOtis
    **[Persuade Janet]
        ->PersuadeJanet
    **[Mark Papers]
        You sit down and mark some papers. That should make your weekend a little easier. 
        ->Main
+{event != "none"}Something catches your attention[]. 
{event == "missingknife":
    ->MissingKnife
}
{event == "pattyfaints":
    ->PattyFaints
}
{event == "areturns":
    ->AdrienneReturns
}
{event == "otisstabs":
    ->OtisStabsMarshell
}
 
-
 ->DONE

===AdrienneReturns===
#c Door
You hear a knock on the door. A teacher with a geniunly warm smile stands there, a clipboard in her hand. 
#c Adrienne
"Hello {sir}, I happened to run into Adrienne, she said that she couldn't find her lesson."
Adrienne stands behind her, looking like she might bolt at any moment. 
*[Cover for her]
	"Yes, Miss. I was just wondering where she might have been." You force a smile. 
	A shared moment between you and this teacher, as you both know you are lying, but the lie makes life easier.
	Adrienne looks a little surprised at you. "So can I come in, {sir}?
	"Of course you can, Adrienne." The teacher answers for you.
*[Call her out]
	"That's strange, Miss, because she was here earlier."
	**[Go into detail]
		"In fact, Adrienne swore at me after she recieved a detention for being late!"
		The smile on her face faulters, just for a second, but she holds it together.
		"Oh, she didn't tell me that part, did you Adrienne?"
	**[Leave it there]
  --Adrienne shakes her head. "Their lying, Miss. I wasn't here."
		The teacher smiles. "We'll talk about this in our session tomorrow, Adrienne. Why don't you go inside for now."
		With a slight huff, Adrienne does just that. 
		The teacher gives you a look of gentle concern before moving on, to find more students who have fled. 
Adrienne sits down in her seat, near Marshell. {instructionsonboard: She looks at the board briefly, before turning to chat to Marshell.|She begins to chat to Marshell}
*[Explain what she has to do]
    You go to Adrienne, and you eventually manage to explain what to do. 
    She stops chatting, and goes to collect the supplies. 
    Who knows, maybe you actually got through to her?
*[Leave her to it]
    She isn't going to do it anyway, may as well leave her to it and try to make sure she doesn't do anything too destructive. 
-->Main
===MissingKnife===
#c Lab
You look at the carefully laid out scalpels, the grey, dull metal allowing them to blur out of your mind. 
*[One of them is missing.]
-You scan along them, looking at their handles with the painted numbers. Numbers 1 through 6 are being used by the students, but it seems that number 7 is also missing. 
*[Shit]
-You look around to the class. What should you do?
*[Stop the class]
    "OK everyone, I need you to stop."
    A few eyes look up at you, but the students continue to do what they were doing, whether it's working or slacking off. 
    **{stress < 10}[Raise your voice]
        "Everyone, listen!" You raise your voice, and this time everyone is looking at you. You have their attention for a bit. 
            ->RaiseVoice
    **{stress >= 10}[Shout at them]
        "Hey!" You shout out, your voice echoing inside of the lab as you try to grab their attention. A couple of them look at you with concern. 
        You pause. 
        ->RaiseVoice
    **{false}Give up
        They're ignoring you. Again. 
        Instead of wasting your time, you decide to go and investigate the missing knife more subtly. 
*{false}Try to investigate subtly
-->Investigate1
=RaiseVoice
*[Tell them about the scalpel.]
    No point beating about the bush.
    "Someone has taken an extra scalpel."
    **[Look at Marshell]
        #c Marshell
        Marshell's is grinning like a cat. He loves what's happening, and he isn't being subtle about it. 
    **[Look at Otis]
        #c Otis
        Otis's expression doesn't change until he notices that you're looking at him. He rolls his eyes and looks annoyed. 
    --
    A silence falls on the class. The only sound is the sound of the rain on the windows, and the wind outside. 
    Marshell is the first to break the silence. 
    #c Marshell
    "Sick!" He laughs. 
    He looks to Otis. "Did you take it, freak?"
    **[Tell him off]
        "Marshell, that is incredibly rude. Apologise, now."
        He just laughs. "Sure thing, {sir}. Don't want to get stabbed now, do I?"
        Adrienne laughs at this. 
    **[Dismiss]
        "Marshell, be quiet."
    --
    #c Lab
    "This is very serious. Whoever took the scalpel needs to give it back. Now."
            Nobody moves. 
    **[Threaten them]
        "I'm serious. If that scalpel isn't placed back, then you are in serious trouble."
        The room stays quiet. 
        ->SendForHelp
    **[Send for help]
        ->SendForHelp
->Main
=SendForHelp
This is way beyond you, someone in here has a knife, and they are not giving it up. 
You need backup. 
You can't leave the class by themselves, especially if one of them is carrying a weapon. 
You need to choose someone to go to the Principals office and get some help. Considering how it must be Marshell or Otis, you can't choose them.
Who should you choose?
-(helploop)
*[Kurt]
    You don't think Kurt took the knife, but you can't trust him to explain what's happening clearly enough. 
    ->helploop
*[Adrienne]
    #c Adrienne
    She'd love a chance to get out of the class, but you can't trust her to go the the principal and not just bunk off instead. 
    ->helploop
*[Patty]
    #c Patty
    She's probably done most of the work already and you trust her not to have done anything stupid. 
    "Patty. Can you please go to the Principals Office and explain that a serious incident has occured."
    Patty stares at you and nods, before rushing off.
    ~pattystate = "getting help"
*[Janet]
    #c Janet
    She doesn't want to be here anyway, and if she doesn't kill a frog, she probably doesn't want to steal a knife. 
    "Janet, Can you please go to the Principals Office and explain that a serious incident has occured."
    Looking shocked, Janet gulps, nods at you and rushes off. 
    ~janetstate = "getting help"

-
As the girl leaves the classroom, Adrienne shouts out. 
    #c Adrienne
"{sir}, that is so unfair! Why didn't you ask me to go?"
*[Be honest]
    "Because I can't trust you, Adrienne." You reply, without missing a beat. 
    Adrienne scoffs, and sits back in her chair. She seems pissed off with your answer. 
*[Avoid the question]
-
#c Lab
You look around to the rest of the class.
*[Tell them to keep working.]
    "Keep working, everyone. You still have to complete the task to get your final grade."
    Kurt goes back to his worksheet{pattystate!="getting help":, as does Patty.} Everyone else just begins staring around the room. 
    ~kurtstate = "working"
    {pattystate!="getting help": 
        ~pattystate = "working"
    }

*[Tell them to do nothing.]
    "Everyone, don't do anything until someone else arrives."
    The class tenses up. There is little movement, apart their eyes, which are all shifting. 
    Otis is trying to not look at anyone, which is hard when most of them are looking at him. 
-
->Main
=Investigate1
There's one knife missing, just one. You can work out where it went, right?
You look around at the students. 
-(investigationloop)
*[Kurt]
    You look at Kurt. 
    { kurtstate == "working":
        <>He's trying hard to fill in his worksheet, his tongue is sticking out as he tries to correctly spell.
    }
    You doubt that he's 
-->Investigate2
=Investigate2
->Main

===PattyFaints===
#a Metallic Item Breaks 2
Suddendly, you hear a crashing sound.
#c Patty
You turn and spot the girl who's name you've forgotten, who has fallen off her stool and onto the ground. 
#c Janet
Janet has moved over to help her. 
*[Go help her]
    You rush to her side, and see that the girl is slowly getting up. 
*[Ask if she's OK]
    You stay back, and ask if she's OK. You can see that she's slowly getting up. 
-"She must have fainted." Janet says. "Are you OK, Patty?"
Ah. That's her name.
~patty = "Patty"
#c Patty
Patty looks pretty shocked. She's shaking as she gets up, but she nods her head. 
"Looks like she's OK. Luckily she didn't fall too badly."
{adriennestate != "absent":You can hear Marshell and Adrienne giggling at Patty.|You can hear Marshell smirking at Patty.}
*[Ask Patty to go to the bathroom]
    "Patty, I think you should go to the bathroom. Get some water."
    **Reassure her
        "Loads of people faint when they have to dissect a frog. It's completly natural."
        Patty still looks pretty shaken up. 
    **Joke about it
        "I guess you're not planning on being a vet in the future!"
        Patty just looks at you confused. You can't blame her, it was a poor attempt at a joke. 
        On the bright side, she has stopped shaking as much.
    --
    Patty shakes her head, grabs her stool and sits back down, ready to work. 
    //{adriennestate != "absent": 
    //Adrienne begins yapping. "{sir}, do you want me to go with her? You know, make sure she's OK?"
    //You just ignore her.
//    ->AdrienneGoesWith->
//    }
*Ask Patty to go back to work.
    "You seem OK, Patty. Do you think you can get back to work?"
    She nods, unsteadily, and is about to return to work when Janet grabs her. She glares at you.
    #c Janet
    "{sir}, that is unaceptable. Patty has just had an accident, she needs to go to the nurses office."
//    "Yeah!" Adrienne chimes in. "I'll take her!"
    **Agree
        You must admit, Janet does have a point. 
        "Very well. Patty, go to the nurses office."
        #c Patty
        Patty looks at you and shakes her head. 
        "Are you sure, Patty?" Janet asks. She gets a nod as an answer. 
        Patty sits down, and begins getting back to work.
//        {adriennestate != "absent": 
//        Adrienne grabs you attention again. "And I'll go with her!"
//        You turn to look at her. 
//        ->AdrienneGoesWith->
//        }
    **Decline
        You can't risk looking weak in front of the rest of the class. 
        "I said no. Sorry, Patty."
        #c Patty
        Patty just shrugs and gets back to work. 
-It seems like the class has calmed down a bit now and is now working. Or at least, pretending to work. 
->Main
=AdrienneGoesWith
    ~pattystate="toilet"
    *"Yes, please". 
        Maybe it will be good to give Adrienne some responsibility. It's not like she'd be doing anything anyway.
        "Yes please, Adrienne, that would be wonderful."
        Adrienne looks a little surprised, but doesn't question it as she leaves. 
        ~adriennestate = "absent"
    *"No, thank you". 
        There's no way you're falling for this. 
        "No, but thank you Adrienne."
        She lets out a over zelous sigh and goes back to pretending to work.
-
->->

===HelpKurt===
    You go other to Kurt. He really looks like he's struggling. 
    It looks like he's cutting his frog way more than he needs to.
    #c Kurt
    *"You OK, Kurt?"
    *"You need help, Kurt?"
    -Kurt jumps and looks at you. 
    "Uhh..." He stammers. He's breathing heavily, and sweat is starting to form on his face.
    *"What's up?"
        Kurt looks really worried. He swallows, partly to moisten his dry mouth so he can speak. 
    *[Look at the frog.]
        Now that you're closer, you can see his frog more closely. 
        #c Empty Frog
        It looks like Kurt's been able to cut it open, but it looks kind of... Deflated?
    -
    #c Kurt
    "I couldn't..." Kurt steadies himself.
    "I don't think I did right. I can't find any organs inside my frog."
    #c Empty Frog
    You look closer at his frog. Kurt's cut is a little wonky but it's fine for opening the thing's guts. 
    The pink layer of skin inside stands out against the green of the frog and the blue of the tray. Where there should be stomach and lungs, muscles, even a skeleton, there is nothing.
    *[Investigate further.]
        You take the scalpel from Kurt and begin prodding at the frog. 
        Pushing down on the outside, you feel resistence, in the limbs and the head. They feel full.
        **[Investigate further]
            #a Ripping guts out of body 1
            You take the scalpel and begin a cut along the head. Usually this would be pointless, as the skull would be too hard to work around. 
            That doesn't matter here, as when you cut open the head, you see no skull, just... Nothing.
            No skull. No brains. Not even a tongue.
            Even the eyes, they aren't spheres. They're like bowls, hollow on the inside, just a small layer pretending to be an eye.
            ***[Investigate further]
                #a Ripping guts out of body 2
                You take the frog and you begin to push the insides through the cut Kurt made.
                You can see the imprints of your fingers behind the pink skin, as it is shoved through. 
                You keep pushing it through, treating it like a glove that's been turned inside out.
                #a Ripping guts out of body 3
                Eventually, the inversion is completed, and the frogs green skin is replaced by the pink, veiny skin of it's insides.
                You slide the skin back into place and the frog now looks, well, full. 
                ****[You hear Kurt asking you something.]
                    #c Kurt
                    You blink. Kurt is looking at you, horrified. You've taken his frog and you've... Twisted it.
                    You can see a few other students are looking at you, expressions of shock and confusion on their faces.
                    You swallow. 
                    *****["Sorry."]
                        "Sorry, Kurt. I'm not able to help you."
                        He nods, slowly. 
                    *****["What?"]
                        "What are you all looking at? Get on with your work."
                        Nothing makes you more annoyed then a bunch of kids looking at you.
                        You look at Kurt. 
                ----"Get another frog and complete the task."
                He slowly gets up, his body shaking, and he goes to get a new frog. 
                You move back to the front of the class. 
                ->Main
        **[Move on]
            ->kurtmoveon
    *(kurtmoveon)[Move on]
        "That's... That's not your fault, Kurt."
        #c Empty Frog
        You look at the frog, this strange thing that shouldn't be possible.
        "Get another frog, and... Yeah, try again."
        #c Kurt
        Kurt nods his head, and hurridly leaves to get a new frog.
        ->Main

===PersuadeJanet===
You decide to try and persuade Janet to try and complete this task again. She's a bright student, and it would be a shame for her to not get a grade for this class.
You grab a tray and equipment and walk over to her desk. 
#c Janet
Even though she hasn't got a frog, you can see her filling in the worksheet. Maybe she's hoping that she can still get the grade.
*(frogdesk)[Place the frog on her desk]
	You place the frog on her desk. She looks up at you with a face of resigned disgust.
	"I don't need to butcher a frog to fill in a worksheet. I'm not a barbarian."
	You think of how you can get her to complete the task. 
	**[Reason with her]
		She's a smart girl, you're sure you can reason with her. But what path should you take?
		***[It's already dead]
			"It's already dead. If you don't do it, someone else will. Or it may just get thrown away."
			She takes some time to process this, before replying. 
			"So should we do the same thing with humans? Grow them in cages then kill them for people to cut them open?"
			"Sounds a bit like Nazi talk, doesn't it, {sir}?"
			****[Defend yourself]
				"How dare you compare me to a Nazi. All I'm doing is asking you to do your work."
				"Yeah, and that's what the Nazi's did as well. 'Just following orders', that's what they said!"
				You've both pushed eachother a bit too fast, and this chat is starting to escelate into an argument!
			****[Chastise her]
				"I think comparing the victims of the Holocaust to dead frogs is deeply offensive, Janet. I expect better from you."
				This does seem to sting her, and she looks like she is about to apologise.
		***[She's more important than a frog]
			"You're way more important than a frog. Why throw away your school career of a stupid amphibian?"
			"Like Ghandi and Budha, {sir}, I'm using non-violent protest. It's withing my rights."
	**[Threaten her]
		The stick is a better teacher then the carrot. What could you threaten her with?
		***[Detention]
			"If you don't take part in the dissection, then I'll have to give you a detention."
		***[Flunk class]
			"This dissection is a mandatory part of the class. If you don't do it, you won't pass this class."
		---"I don't care." She throws down her pencil. "I'm not doing it."
		Seems like no matter what you do, she won't budge. 

*[Ask her how she's doing.]
	Perhaps it's better to ask her what's bothering her instead of pushing the task on her. 
	"Are you OK, Janet? How are you feeling?"
	Janet bites her lip. It's clear she doesn't want to talk about this with you. 
	**[Push on]
	**[Go onto a different topic]
		Perhaps better to move on and try a different topic.
		"I really need you to do this, Janet. Please make the right-"
		"Why?" Janet interupts, raising her head to look at you. "Why do you need me to do this?"
			***[Answer the question]
				"Because your normal teacher asked me to." It's the truth, after all. 
				"Can't you just tell him that I did it, then?"
				You briefly consider how to answer this question.
			***[Ignore the question]
-
#a Breathing 4
Suddendly, you hear what sounds like a desperate gasp.
*[Look at Kurt]
*[Look at Otis]
*[Look at Marshell]
*[Look at Patty]
#c Lab
-You quickly look at a random person around the room, but no one seems to be in trouble.
You hear the gasp again. It's coming from the tray {frogdesk:on the desk.|in you hand.}
*{frogdesk}[Drop the tray]
	You quickly drop the tray onto the desk and step away from it.
-
#c Uncut Frog
Inside the tray, the frog you told a student to open up lies down, desperatly gasping, it's throat expanding and contracting with great difficulty.
It's arms and legs writhe slowly, pawing at the air, as if the frog is trying to swim through the air and escape.
Janet stares at the action in front of her, an expression of horified curiousity. 
*[Tell her to get away from it]
	"Janet, get away from it."
	#c Janet
	She snaps her head to look at you. She's shaking. 
	"It's... It's hurt."
*[Get closer to the frog]
    You can't help but be inttrigued by this. This frog was dead, or appeared to be dead, and now it was alive.
    You slowly inch closer to the desk, making no sudden moves. 
-
"A frog should not be making that noise." Janet gets even closer. 
"Frogs don't breathe the way we do, they use their throat to get air into the lungs."
*[Ask her how she knows so much]
    #c Janet
    "I did a lot of research for this lesson, so I didn't have to cut the frog open."
    #a Breathing 4
    She smiles, before quickly going back to rebel. "Sort of proves how useless it is, doesn't it?"
*[Don't question her]
-
#c Uncut Frog
You say nothing, and keep staring at the frog. It's breathing is still shallow, still barely moving. The limbs begin to slacken again.
*[Put it out of it's misery]
    How will you kill the frog?
    **[Scalpel]
        You take a scalpel from the equipment.
        "What are you doing?" Janet says loudly, but she makes no attempt to stop you.
        You take a look at the worksheet and try to work out where the heart of the creature is. 
        There. Your target found, you place the scalpel in the correct position and stab. 
        #a Bloody stabs 2
        There is surprisingly very little blood. The frog stops moving. You have killed it. 
    **[Smother it]
        You take a piece of cloth, used to clean up messes. 
        #a Breathing 4
        "What are you doing?" Janet says loudly, but she makes no attempt to stop you.
        You place it over the mouth and nostrils of the frog, cutting off the air supply.
        For a while you think that it's not working, the frog doesn't struggle back. It just keeps on swimming. 
        #a none
        Eventually the frog stops moving completly. You have killed it.
*[Try to help it]
    How will you try to help the frog?
    **[Perform CPR on the frog.]
        #c Uncut Frog
        Your mind racing, you try and think of something, anything to help. 
        You take the frog and you try to assist it in it's breathing, massaging the throat, pulling it out and pushing it back in again.
        "What are you doing?" Janet says loudly, but she makes no attempt to stop you.
        It's not working. You try and press down on the frog, it's dried out skin feeling alien beneath your fingers. 
        You begin to perform CPR. 
        1...
        2...
        3...
        #a Ripping guts out of body 1
        You hear a squelch. 
        The frog stops moving. You must have pressed down too hard, applied too much pressure on an organ. You have killed the frog.
    **[Ask Janet for help.]
        You were not prepared for this. "Any ideas, how can we save it?" You ask.
        "I don't know." Janet sounds stressed, sound desperate. "I don't..."
        She points at you. "I'm just a student, you're the teacher. You should be the one helping me!"
        #a none
        Neither of you speak after that outburst. You just watch as the frog continues to struggle to breath, until it stops moving. 
        You have effectivly killed the frog. 
-
#c Janet
Janet looks at you with fear and disgust in her eyes. 
*[Tell her to disect the frog]
    You have to put distance between you and her. You have to help her become stronger. 
    "This frog died of natural causes. Disect it."
    The disgust is gone, so is the fear. In her eyes, you only see rage.
    She keeps it in, and says nothing. You still don't think she's going to disect it.
*[Tell her she doesn't need to disect the frog]
    This experience was traumatic for you, you can only imagine how traumatic it must have been for her. 
    "I'll try and explain what happened to Mr Barker. You won't need to disect the frog."
    The disgust is gone, so is the fear. Now there is just pity, though who the pity is for you can not say.
    She keeps it in, and says nothing. 
-You leave the frog where it is. It will get cleaned away eventually. And you don't want to go near the creepy little thing.
-->Main

===CheckOnOtis===
#c Otis
Otis seems to be trying to hide what he's doing, you decide to investigate.
He notices you moving over to him and hurridly moves his worksheet, covering something on his desk. 
*[Ask him what he's doing]
    "What you doing there, Otis?"
    He quickly looks away from you. "Nothing."
    **[Press him]
        "Come on, Otis. Tell me."
        He still sits there, unresponsive. You're about to turn around when you notice something. 
        ->SeeCarving        
    **[Leave it]
        He's being unresponsive, probably best to just leave him. 
        You can focus on the people who have a chance instead. 
        ->Main
*[Ask him if he needs help]
    "You need help there, Otis?"
    He looks at you uneasy, before shaking his head. "I'm fine."
    **[Press on]
        "Come on, Otis. I'm happy to help you if you need it."
        He still sits there, unresponsive. You're about to turn around when you notice something. 
        ->SeeCarving        
    **[Leave him.]
    He's being unresponsive, probably best to just leave him. 
    You can focus on the people who have a chance instead. 
    ->Main
-
->Main
=SeeCarving
#c Demon Sign
On Otis's desk, you see that some sort of symbol has been carved into it. There's sawdust near it, so it's been done recently. 
The symbol makes you feel... Uneasy. Like there is someone staring at you, just out of eyesight. 
-(carvingloop)
*[Look at the letters]
    It looks... The carving is small and uneven, but it looks like there are letters lining the circle. 
    "B", "L"... That maybe an "E"?
    It's too uneven to tell. 
    ->carvingloop
*[Look at the centre]
    Despite the simplicity of the rune, you know, you're certain, that whatever is laid out inside the circle is dead.
    It's limbs laid out, waiting to be cut open. 
    ->carvingloop
*Ask Otis about the carving
-"Otis, what is this?"
#c Otis
Otis looks scared. He whispers, barely audible. "I don't know."
He looks up at you, locking his eyes with yours. "I keep on seeing it, it small places around the school, around the town."
"I dunno, I thought it looked cool..."
*[Give him a detention]
    "I'm going to have to give you a detention, Otis, for vandalism."
    He nods, but you don't think he really hears you.
 *[Leave him be]
-You make your way back to your desk at the front of the classroom, making a mental note to yourself to file a report on what just happened. 
It's clear to you that Otis needs help. 
->Main
===OtisStabsMarshell===
#b Ambience_Horror_Classic_03
#c Otis
"Stop calling me a freak!"
The class goes silent. Otis is standing up, shouting at Marshell, who's sat down and smirking. 
*[Shout out Otis]
    "Otis!" You shout out, but he ignores you.
*[Shout out Marshell]
    "Marshell!" You shout out. 
    #c Marshell
    He looks at you with with fake confusion. "I don't know what he's talking about, {sir}!"
-
#c Otis
"I am so sick of your shit!" Otis is full on screaming now, it's clear that he's lost control of himself. 
#c Marshell
Marshell just laughs, clearly loving the reaction that he's caused. "What are you going to do about it?"
*[Tell Otis to sit down]
    "Otis, sit down, now!" You call out, but you're ignored. 
*[Tell Marshell to shut up]
    "Marshell, shut up!" You call out, but you're ignored. 
-
#c Otis
Otis starts making his way towards Marshell, who stands eagerly. 
#c Marshell
"You want to do this, freak?"
#c Otis
Otis says nothing, but reaches into his pocket. You see the glint of light on metal.
*[Shout at them again]
*[Go over to break them up]
-
#a Dagger Stab (Flesh) 2
#c clear
Before you can do anything, Otis takes out the stolen scalpel and swipes it at Marshell!
#a Female screams 2
Adrienne screams, while Marshell raises his hands to defend himself. 
Blood sprays from somewhere and it covers Marshells uncut frog. 
*[What do you do?]
*[What can you do?]
-
->JanetKillsOtis
=JanetKillsOtis
#c Kurt
-As you stand there in shock, you see Kurt rushes towards Otis from behind and shoves him. 
#c Janet
As turns to recover, Janet, making use of the distraction, comes up from behind him and-!
CRACK!
#c clear
#a Punch 6
She has slammed a heavy book into the side of Otis's head, who is stunned!
#a Bloody punches 1
As Otis falls, his head hits the side of the desk, with a sickening crunch. He lies on the floor, stillless. 
*[Say something]
    "Well done, Janet."
*[Say anything]
    "Oh my god, is he dead?"
-Janet drops to her knees, desperatly searching around Otis, slapping his face, trying to get him to wake up.
Marshell collapses onto a stall, one hand wrapped tightly around the other, breathing heavily. 
"Oh my god, oh my god." Adrienne keeps on repeating to herself, as she looks between Marshell and Otis. 
Kurt's pale face becomes even paler, he hurries over to the bin and you can hear the sound of vomiting. 
Otis continues to lie still on the floor.
*[It all begins to fade together]
-
#b none
You don't know who came into the classroom, but they took over and sorted everything out. Well, as much as they could.
Marshell and Otis are taken by the paramedics and taken to the hospital. They looked uncertain when they took Otis away.
You and the students are moved, guided, to a different room, the staff room. You're given biscuits.
Janet, Adrienne and Kurt are taken, one by one, to be questioned. Eventually, you are all alone.
-(finalloop)
#c clear
*[You think about Otis]
    #c Otis
    <> Could you have done something to help him? Is he going to survive? Is he brain dead? 
    Questions swim around your head, you need to focus on something else. 
*[You think about Marshell]
    #c Marshell
    His hand looked really messed up. He shouldn't have provoked Otis, but still...
    A small part of you thinks that he deserved this.
*[You think about Janet]
    #c Janet
    Poor Janet. When she woke up this morning, she thought the worst part of her day was that she was going to be asked to disect a frog. 
    And now...
    She's going to be in therapy forever.
*[You think about your job]
    Everytime you think about your job, you feel bile rising to your throat. 
    It will be a miracle if you keep your job. 
    It would be another one if you ever got hired for anything again. 
    And what if Otis's parents sue? Or Marshells?
    You need to stop thinking about this. It's not helping. 
*{finalloop > 3}You remember that you're not alone
    ->PattyDemon
-->finalloop
=PattyDemon
#c Patty
Why did you think that you were alone? You can see Patty right there, staring out of a window. 
She's been quiet ever since you all were ushered away from the classroom. 
*[Ask her if she's OK]
    "Are you OK, Patty?"
    She just sits there, and says nothing. 
*[Ignore her]
    <> You don't feel like being a teacher at the moment. 
-You turn back towards the door, and wait for someone to go through. 
*"You failed them, {sir}."
-
#b Scary atmosphere 1
You jump. Patty is still looking out of the window, but she's definitely talking to you.
Her voice is quiet, but it has an authority to it. One that you could have used today.
-
*[Ignore Her]
    She must still be in shock. You decide to ignore her.
*[Ask her what she means]
    "What do you mean, Patty?"
-
"You failed them." She continues. "You were their teacher, and you failed them."
She turns around and looks at you. "You failed me, {sir}."
Slowly, she begins walking towards you.
*[Move]
    You try to move, but you can't!
*[Stay still]
-You're stuck in your seat, feeling like you cannot leave, you are not allowed to leave. 
#c Demon Sign
"It was so easy." She begins to smile. "It was so easy to steal the knife. It was so easy to steal the girl."
Her voice... It's so dark. 
"She was invisible to you, you never saw her, never knew her or the children like her."
"What great soldiers they are. What great weapons you have made them."
*[Move]
    No. You can't. You're not allowed. 
*[Stay]
-"My armies are invisible. My wars are fast and done, so soon. My children must learn."
The girl whose name you don't remember grabs your face, her rough, scaly fingers slowly pressing you down into the ground.
You lie their, on the ugly staffroom carpet, and you spread your arms and legs as you wait.
"You will become frogs to me. To be born, grown, raised to die, for the children to learn from." 
From her skin emerges a long, bloodstained scalpel. She raises it to your throat. 
"Do not worry, teacher. My children will learn so much from you.
#b none
#a Bloody stabs 2
->END
===function changeKurtState(newstate)
    {kurtstate != "dead":
        ~kurtstate = newstate
    }
    
===function changeOtisState(newstate)
    {otisstate != "dead":
        ~otisstate = newstate
    }
    
===function changeMarshellState(newstate)
    {marshellstate != "dead":
        ~marshellstate = newstate
    }
    
===function changeAdrienneState(newstate)
    {adriennestate != "dead":
        ~adriennestate = newstate
    }
    
===function changePattyState(newstate)
    {pattystate != "dead":
        ~pattystate = newstate
    }
    
===function changeJanetState(newstate)
    {janetstate != "dead":
        ~janetstate = newstate
    }

===function getRandomState()
    {RANDOM(1, 5):
        -1: Kurt seems to be struggling, again.
        -2: Otis isn't doing any work...  Again...
        -3: Marshell seems to be spitting on his frog. 
        -4: {adriennestate != "absent" and adriennestate != "pretending to help":Adrienne is fixing her makeup|Adrienne still hasn't returned.}.
        -5: Janet is sulking, refusing to do her work. 
    }

===getOptions
    *{kurtstate == "needshelp"}Go help Kurt
        ->HelpKurt
    *{kurtstate == "needshelp"}
        ->HelpKurt
        

===function changeClassMood(value)
    ~kurtmood += value
    ~otismood += value
    ~marshellmood += value
    {adriennestate != "absent":
        ~adriennemood += value
    }
    ~pattymood += value
    ~janetmood += value

===function progressTime()
    ~time += 10
    ~event="none"
    {time == 20:
        ~event = "pattyfaints"
    }
    {time == 30 and adriennestate == "absent":
        ~event = "areturns"
    }
    {time == 50:
        ~event = "missingknife"
    }
    {time == 60:
        {janetstate == "getting help":Janet|Patty} returns, saying that another teacher is coming soon.
        ~event = "otisstabs"
    }
