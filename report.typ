#import "neurotyp.typ": report

#let first = [
  Biggie
]
#let last = [
  Smalls
]
#let patient = [
  Biggie Smalls
]
#let doe = [
  2023-04-04
]

#show: doc => report(
  title: [NEUROCOGNITIVE EXAMINATION],
  // first: [Biggie],
  // last: [Smalls],
  patient: [Biggie Smalls],
  doe: [2023-04-04],
  cols: 1,
  doc,
)


// BEGIN DOCUMENT
#v(1em, weak: true)
*PATIENT NAME:* #patient \ 
*DATE OF EXAM:* #doe \ 

= TESTS ADMINISTERED

- Conners' Adult ADHD Diagnostic Interview for DSM-IV (CAADID), Part I: History
- Conners' Adult ADHD Rating Scales--Self-Report: Long Version (CAARS--S:L)
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Self-Report Form
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Observer Form
- Advanced Clinical Solutions (ACS): Word Choice, Test of Premorbid Functioning (TOPF)
- Wechsler Adult Intelligence Scale, 4th ed (WAIS-IV)
- Wide Range Achievement Test, 5th ed (WRAT-5): Word Reading
- Neuropsychological Assessment Battery, Screener (NAB):
  - Attention, Language, Memory, Spatial, and Executive Functions Modules
- NIH Executive Abilities: Measures and Instruments for Neurobehavioral Evaluation and Research (NIH EXAMINER):
  - Unstructured Task, Verbal Fluency, and Behavioral Rating Scale
- California Verbal Learning Test, 3rd ed (CVLT-3), Brief Form
- Rey-Osterrieth Complex Figure Test (ROCFT)
- Trail Making Test
- Personality Assessment Inventory (PAI)

= NEUROBEHAVIORAL STATUS EXAM

== Referral

#first was referred for neuropsychological testing as part of a comprehensive
work-up for attention-deficit/hyperactivity disorder (ADHD). The results will be
used in academic and treatment planning

== Background

The following information was obtained during an interview with #first and from review of available medical records. #first "Saw a post online of someone recently diagnosed with ADHD, and experiences very similar to mine, which brought this possibility to my attention." She has been experiencing symptoms of procrastnation, distractibility, and difficulty with organization and time.
#first has been experiencing these symptoms since childhood, but they have been
more problematic in the past few years. She has been able to compensate for her
difficulties by working harder and longer than her peers.

=== Past Neuropsychological Test Results 

Patient denied having prior testing.

=== Developmental History

- No birth complications.
- Developmental milestones: Normal.

=== Other Medical History 

- Frequent sinus infections.
- Medications: None; no history of psychotropics.
- Appetite/weight: History of not usually feeling hungry and not eating much.
- Sleep: Normal.
- Alcohol/tobacco: No history of abuse; denied current use.

=== Surgical History 

None reported.

=== Psychiatric History 

Transient depression. 

=== Family History 

Patient denied a family history of neurological conditions. Parental history of depression and suspected ADHD.

=== Cultural/Social Background

#first is an East Asian nonbinary queer graduate student who was born and raised in China
and then moved to the US.
She is in a relationship with her partner, never married, and has no children.

=== Educational History 

- Both parent and self-report suggest that academic difficulties (some social difficulties as well) began to emerge in middle school and were present during high school.
- Pt recalls "being disruptive" in class and having difficulty with "talking too much" and "zoning out." 
- Her mother had to sit with her and do her homework with her. 
- #first graduated from college (USYD) and is completing her Master’s-degree in film from USC. 
- She did not endorse any difficulties with advancing through college, but challenges have again emerge during graduate school.

=== Occupational History 

- Past work as a translator, sales assistant, and waitress.
- Plans to work in the film industry after graduation.

= NEUROCOGNITIVE FINDINGS

== Behavioral Observations

- _Attention:_ Orientation to person, place, time, and situation was intact.
- _Appearance:_ Appropriate grooming and dress for context.
- _Behavior/attitude:_ Cooperative, engaged.
- _Speech/language:_ Fluent and normal in rate, volume, and prosody.
- _Mood/affect:_ Neutral, range was full and appropriate.
- _Sensory/motor:_ Performance was not limited by any obvious sensory or motor difficulties.
- _Cognitive process:_ Coherent and goal directed.
- #emph[Motivation/effort:] Normal.

== Intelligence/General Ability

#first's premorbid verbal ability was estimated to be within the Average range. However, this likely underestimated her true ability, given that English is her second language. 

In contrast, a culturally neutral screening of her visuoperceptual, visuoconstructional, and nonverbal reasoning skills yielded Above Average results. An evaluation of her neuropsychological functioning (independent of general intelligence) measured in the domains of attention and executive functioning, language, spatial processing, and memory was Average, with relative weaknesses in attention and executive functioning.

#align(center)[#table(
  columns: 4,
  align: (col, row) => (left,center,center,center,).at(col),
  inset: 6pt,
  [#strong[Scale]], [#strong[Score]], [#strong[‰ Rank]], [#strong[Range]],
  [General Ability],
  [114],
  [82],
  [High Average],
  [Crystallized Knowledge],
  [116],
  [86],
  [High Average],
  [Fluid Reasoning],
  [118],
  [88],
  [High Average],
)
#align(center, [Table 1: General Cognitive Ability])
] <tbl-md-iq>

#figure(
  image("fig-iq-1.svg", width: 70%),
  caption: [
    _General Ability_ refers to an overall capacity to reason, to solve problems, and to learn useful information. _Crystallized Knowledge_ refers to the ability to learn and use language to reason and understand how the world works. _Fluid Reasoning_ refers to the ability to use logical reasoning to figure things out without being told exactly how things work, analyze and solve novel problems, identify patterns and relationships that underpin these problems, and apply logic.
  ],
) <fig-iq>


== Verbal/Language

Verbal processing was ...

#let desc = read("02.04_verbal.md")
#raw(desc, lang: "md")

== Visual Perception/Construction


#let amazed(term) = box[✨ #term ✨]

You are #amazed[beautiful]!

== Attention/Executive
#let fig-cap-exe2(desc) = box[#desc]
#let fig-cap-exe = box[
  _Attentional and executive functions_ underlie most, if not all, domains of cognitive performance. These are behaviors and skills that allow individuals to successfully carry-out instrumental and social activities, academic work, engage with others effectively, problem solve, and successfully interact with the environment to get needs met.  
]
#let cell = rect.with(
  inset: 8pt,
  width: auto,
  height: auto,
  radius: 12pt,
  stroke: none
)

#grid(
  columns: (60%, auto),
  align(center)[#image(
    "fig_executive.png", width: 100%)
],
  cell(width: 100%)[
    #fig-cap-exe 
],
)


== Memory
<memory-text>
The examinee exhibited an overall high average performance in verbal and visual memory functioning, with low average recall of rote verbal information (word list) and average recall of the list after a short delay or long delay with cues. Performance on a more complex one-trial verbal learning and recall task (story learning) was high average, as well as their delayed recall of the story details over time. Furthermore, learning and recognition of visual material (abstract shapes) was high average, while recognition of the target visual material among nontarget distractors after a delay period was average. Spontaneous, long-term delayed recall (20-25 min) recall and reproduction of a complex abstract figure also fell within the average range.

#let memory = csv("memory.csv")
#show figure: set block(breakable: true)

#align(center, text(10pt)[#table(
  fill: (_, row) => if calc.odd(row) { luma(240) } else { white },
  columns: 4,
  align: (col, row) => (left,center,center,center,).at(col),
  inset: 6pt,
  [#strong[Scale]], [#strong[Score]], [#strong[‰ Rank]], [#strong[Range]],
  ..memory.flatten(),
)
]
) <tbl-md-memory>
#align(center, [Table 1: Learning and Memory])

#show figure: it => align(center)[
  #it.body
  #strong[
  #it.supplement
  #it.counter.display(it.numbering).
]
  #it.caption
]

#figure(
  placement: bottom,  
  caption: [
    _Learning and memory_ refer to the rate and ease with which new information (e. g., facts, stories, lists, faces, names) can be encoded, stored, and later recalled from long-term memory.
  ],
  caption-pos: top,
  image("fig-memory-1.svg", width: 60%),
) <fig-memory>

#let fig-cap-mem = box[
  _Learning and memory_ refer to the rate and ease with which new information (e. g., facts, stories, lists, faces, names) can be encoded, stored, and later recalled from long-term memory.  
]
#let cell = rect.with(
  inset: 8pt,
  width: auto,
  height: auto,
  radius: 12pt,
  stroke: none
)
#grid(
  columns: (60%, auto),
  figure(
  image("fig-memory-1.svg", width: 100%),
),
  cell(width: 100%)[
    #fig-cap-mem
],
)


== ADHD/Executive Functioning



== Emotional/Behavioral/Personality



= SUMMARY/IMPRESSION
