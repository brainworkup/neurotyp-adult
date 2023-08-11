// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

#let report(
  title: none,
  author: none,
  patient: [],
  firstname: none,
  lastname: none,
  doe: none,
  date: none,
  cols: 1,
  paper: "a4",
  margin: (x: 25mm, y: 30mm),
  lang: "en",
  region: "US",
  font: (),
  fontsize: 11pt,
  sectionnumbering: none,
  doc,
) = {
  
  // Metadata
  set document(
  title: title,
  author: "author"
  )
  
  // Set page size, margins, and header.
  set page(
  paper: paper,
  margin: margin,
  header: locate(
        loc => if [#loc.page()] == [1] {
            []
        } else {
            [
              #set text(9pt)
              #smallcaps[
               *CONFIDENTIAL* \ 
               #patient \ 
               #doe
             ]
           ]
        }
    ),
  numbering: "1/1",
  number-align: right,
  columns: cols
)
  // Set paragraph justification and leading.
  set par(
  justify: true,
  leading: 0.52em,
)
  // Save heading and body font families in variables.
  let body-font = "Ale­greya"
  let sans-font = "Ale­greya Sans"

  // Set text and body font family.
  set text(font: body-font, lang: lang, region: region, size: fontsize)
  show math.equation: set text(weight: 400)

  // Set heading numbering.
  set heading(numbering: sectionnumbering)

  // Set paragraph spacing.
  show par: set block(above: 1.2em, below: 1.2em)
  
  // Set heading font.
  show heading: set text(font: sans-font) 

  // Set run-in subheadings, starting at level 4.
  show heading: it => {
    if it.level > 3 {
      parbreak()
      text(10pt, style: "italic", weight: "regular", it.body + ".")
    } else {
      it
    }
  }

  // Configure lists and links.
  set enum(indent: 5pt, body-indent: 5pt)
  set list(indent: 5pt, body-indent: 5pt)
  show link: set text(font: "New Computer Modern Mono")

  // Logo
  block(
    figure(
      image("logo.png"),
    )
  )

  // Title row.
  align(center)[
    #block(text(font: sans-font, weight: 700, 1.75em, title))
    #v(2.2em, weak: true)
  ]

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}
#show: report.with(
  title: "NEUROCOGNITIVE EXAMINATION",

  patient: [Biggie Smalls],

  firstname: "Biggie",

  lastname: "Smalls",

  doe: [2023-01-01],

)


#v(2pt, weak: true)
*PATIENT NAME:* #patient \  
*DATES OF EXAM:* #doe \  
= TESTS ADMINISTERED
<tests-administered>
- Comprehensive Neuropsychiatric Symptom and History Interview
- Conners' Adult ADHD Diagnostic Interview for DSM-IV (CAADID), Part I: History
- Conners' Adult ADHD Rating Scales--Self-Report: Long Version (CAARS--S:L)
- Conners' Adult ADHD Rating Scales--Observer Report: Long Version (CAARS--O:L)
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Self-Report Form
- Comprehensive Executive Function Inventory Adult (CEFI Adult) Observer Form
- Advanced Clinical Solutions (ACS):
  - Word Choice, Test of Premorbid Functioning (TOPF)
- Dot Counting Test
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
<neurobehavioral-status-exam>
== Referral
<referral>
Biggie was referred for neuropsychological testing as part of a comprehensive presurgical work-up of her epilepsy syndrome. The results will be used in surgical and treatment planning

#import "@preview/tablex:0.0.4": tablex

#tablex(
  columns: (auto, 1em, 1fr, 1fr),  // 4 columns
  rows: auto,  // at least 1 row of auto size
  fill: red,
  align: center + horizon,
  stroke: green,
  [WAIS-4], [b], [c], [d],
  [], [f], [g], [h],
  [], [j], [k], [l]
)
== Background
<background>
The following information was obtained during an interview with Biggie and from review of available medical records. Biggie "Saw a post online of someone recently diagnosed with ADHD, and experiences very similar to mine, which brought this possibility to my attention." She has been experiencing symptoms of procrastination, distractibility, and difficulty with organization and time. Biggie has been experiencing these symptoms since childhood, but they have been more problematic in the past few years. She has been able to compensate for her difficulties by working harder and longer than her peers.

Cognitive complaints: sustained attention, working memory, and word-finding issues over the last 2 years.

== History
<history>
=== Past Neuropsychological Test Results
<past-neuropsychological-test-results>
Patient denied having prior testing.

=== Developmental History
<developmental-history>
- No birth complications.
- Developmental milestones: Normal.

=== Other Medical History
<other-medical-history>
- Frequent sinus infections.
- Other medications: Femcon, folic acid.
- Appetite/weight: Normal, no changes.
- Sleep: Normal, no changes.
- Alcohol/tobacco: No history of abuse; denied current use.

=== Surgical History
<surgical-history>
Sinus surgery.

=== Psychiatric History
<psychiatric-history>
Patient denied.

=== Family History
<family-history>
Patient denied a family history of neurological conditions. Her brother was diagnosed with ADHD.

=== Cultural/Social Background
<culturalsocial-background>
Biggie is a Caucasian female who was born and raised in XXXX. She is single, never married, and has no children.

=== Educational History
<educational-history>
Biggie graduated from college and completed some Master’s-level courses. She did not endorse any difficulties with advancing through school.

=== Occupational History
<occupational-history>
Biggie has worked full time as an administrator in a small company. She has maintained this job for the past 6 years.

= NEUROCOGNITIVE FINDINGS
<neurocognitive-findings>
== Behavioral Observations
<behavioral-observations>
- #emph[Appearance:] Appropriate grooming and dress for context.
- #emph[Behavior/attitude:] Cooperative, engaged.
- #emph[Speech/language:] Fluent and normal in rate, volume, and prosody.
- #emph[Mood/affect:] Neutral, range was full and appropriate.
- #emph[Sensory/motor:] Performance was not limited by any obvious sensory or motor difficulties.
- #emph[Cognitive process:] Coherent and goal directed.
- #emph[Motivation/effort:] Normal.

== General Cognitive Ability
<general-cognitive-ability>
An estimate of premorbid verbal ability level fell within the Average range. General Intelligence (#emph[G]) was Average and ranked at the 50th percentile, indicating performance as good as or better than 50% of same-aged peers from the general population. An estimate of Crystallized Intelligence (#emph[G]c) was classified as Average and ranked at the 50th percentile. Fluid Reasoning (#emph[G]f) was classified as Average. Working Memory (#emph[G]wm) was a relative {strength,weakness}, falling in the Average range. Processing Speed (#emph[G]s) was Average. Finally, broad neurocognitive functioning (independent of general intelligence) across domains of attentional and executive functioning, language and spatial processing, and learning and memory was Average.

<qtbl-iq>
#figure([#image("table_iq.png", width: 50%)],
  caption: [
    Composite intellectual and neuropsychological index scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-iq-1.svg", width: 70%)],
  caption: [
    #emph[General Ability] refers to an overall capacity to reason, to solve problems, and to learn useful information. #emph[Crystallized Knowledge] refers to the ability to learn and use language to reason and understand how the world works. #emph[Fluid Reasoning] refers to the ability to use logical reasoning to figure things out without being told exactly how things work, analyze and solve novel problems, identify patterns and relationships that underpin these problems, and apply logic.
  ]
)
<fig-iq>

== Verbal/Language
<verballanguage>
Screening of Biggie’s language comprehension and expression skills was intact for her age, demographic background, and educational history. Biggie demonstrated Average phonemic (letters) word fluency and Average semantic (categories) word fluency. Their word-finding ability and retrieval fluency were Average, with no notable dysfluency in informal conversation. Auditory comprehension and rapid reading and color naming tasks were also performed at an Average level.

<qtbl-verbal>
#figure([#image("table_verbal.png", width: 70%)],
  caption: [
    Language processing test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-verbal-1.svg")],
  caption: [
    Verbal/Language refers to the ability to access and apply acquired word knowledge, to verbalize meaningful concepts, to understand complex multistep instructions, to think about verbal information, and to express oneself using words.
  ]
)
<fig-verbal>

== Visual Perception/Construction
<visual-perceptionconstruction>
Performance across measures of visual perception, construction, motor integration, and spatial navigation of visual/environmental information was Average overall. Visuoperceptual matching requiring close attention to visual detail was Average. Visuoconstruction assembly requiring nonverbal reasoning and quick processing speed was Average. Finally, visuoconstructural drawing/copying of a complex figure requiring visuospatial integration, planning and organization, and efficient encoding of nonverbal material was Average.

<qtbl-spatial>
#figure([#image("table_spatial.png", width: 70%)],
  caption: [
    Visuospatial processing test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-spatial-1.svg")],
  caption: [
    #emph[Visuoperception, visuoconstruction, and visuospatial processing] refer to abilities such as mentally visualizing how objects should look from different angles, visualizing how to put objects together so that they fit correctly, and being able to accurately and efficiently copy and/or reproduce visual-spatial information onto paper.
  ]
)
<fig-spatial>

== Attention/Executive
<attentionexecutive>
Formal testing of an array of attention and executive functions revealed heterogeneous skills. A composite index of both basic and complex verbal and nonverbal attentional capacity/functioning was Average. A composite index of higher executive skills was Average. Orientation to person, place, time, and situation was intact. No gross behavioral apathy or disinhibition observed. Auditory attentional capacity was Average (\# digits forward). Working memory for orally presented information was Average (\# digits backward).

<qtbl-executive>
#figure([#image("table_executive.png", width: 70%)],
  caption: [
    Attention/Executive Functioning Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-executive-1.svg")],
  caption: [
    Attentional and executive functions underlie most, if not all, domains of cognitive performance. These are behaviors and skills that allow individuals to successfully carry-out instrumental and social activities, academic work, engage with others effectively, problem solve, and successfully interact with the environment to get needs met.
  ]
)
<fig-executive>

== Memory
<memory>
Learning and recall of rote verbal information (word list) was Average overall. Recall of the list after a short delay was Average. Recall of the list after a long delay was Average, as she was able to recall nearly all the material she had learned. Memory recall of more complex verbal information (short story) was Average for immediate free recall. Delayed recall of the story details was preserved|diminished over time. Learning and recognition of visual material (abstract shapes) was Average. Recognition of the target visual material among non-target distractors after a delay period was Average, suggesting stable memory consolidation over time. Finally, spontaneous, long-term delayed recall (20-25 min) recall and reproduction of a complex abstract figure fell within the Average range.

<qtbl-memory>
#figure([#image("table_memory.png", width: 70%)],
  caption: [
    Learning and memory test scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-memory-1.svg")],
  caption: [
    #emph[Learning and memory] refer to the rate and ease with which new information (e. g., facts, stories, lists, faces, names) can be encoded, stored, and later recalled from long-term memory.
  ]
)
<fig-memory>

== ADHD/Executive Functioning
<adhdexecutive-functioning>
Biggie completed self-report rating scales of adult ADHD symptoms and executive functioning in everyday life. Consistent and overlapping difficulties were reported in the areas of:

On the companion observer-reports, Mrs. Wallace, Biggie’s mother, reported that Biggie evidences moderate to severe difficulties in the areas of:

<qtbl-adhd>
#figure([#image("table_adhd.png", width: 70%)],
  caption: [
    ADHD related rating scales
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-adhd-1.svg")],
  caption: [
    Attention and executive functions are multidimensional concepts that contain several related processes. Both concepts require self-regulatory skills and have some common subprocesses; therefore, it is common to treat them together, or even to refer to both processes when talking about one or the other.
  ]
)
<fig-adhd>

== Emotional/Behavioral/Personality
<emotionalbehavioralpersonality>
Biggie completed an objective, self-report inventory of personality and emotional functioning. Given their scores on the validity scales, there are no problems with interpreting the clinical profile. They responded in an open and forthright manner, indicating only modestly elevated levels of stress and anxiety. They seem to have a positive self-image and are likely viewed by others as warm and friendly. There do not appear to be any contributing emotional factors that would account for their current cognitive difficulties.

On the clinical scales, Biggie’s profile revealed no elevations above the clinical skyline that would indicate the presence of clinical psychopathology in the areas that are tapped by the individual clinical scales. Based on interpretation of Biggie’s scores, she reported some preoccupation with physical symptoms and bodily complaints (#emph[elevated SOM-H]); it is possible that she may express `r params$his_her` psychological distress through somatic symptoms. `r params$first_name` reported high perceived stress, a great deal of tension, and having difficulty relaxing (#emph[elevated ANX-A]). She appears to have a tendency to be impulsive and her impulsive behaviors may interfere with interpersonal problems and school functioning (#emph[elevated BOR-S]). As a result of her desire for excitement and stimulation, `r params$first_name` may often become easily bored by routine activities (#emph[elevated ANT-S]). Furthermore, Biggie’s profile suggests `r params$he_she` tends to be egocentric and have little regard for others. Although she may feel guilt over past misbehaviors, `r params$he_she` may feel little long-standing remorse (#emph[elevated ANT-E]). On the NON scales, Biggie’s score suggests she generally feels her family is a source of social support. However, `r params$he_she` may have few close interpersonal relationships. Finally, `r params$first_name`’s RXR score suggests she acknowledges the need to make changes and reports having a generally positive attitude towards making personal change. Given the patient’s diagnosis of ADHD and Mood Disorder, the patient’s personality profile appears to explain some of her classic symptoms such as concentration difficulties, stimulus seeking, irritability, and impulsive behavior.

#figure([#image("template_files/figure-typst/fig-emotion-1.svg")],
  caption: [
    Mood/Self-Report
  ]
)
<fig-emotion>

#pagebreak()
= SUMMARY/IMPRESSION
<summaryimpression>
#figure([#image("template_files/figure-typst/fig-domain-plot-1.svg")],
  caption: [
    #emph[Note:] #emph[z]-scores have a mean of 0 and a standard deviation of 1.
  ]
)
<fig-domain-plot>

== Summary and Formulation
<summary-and-formulation>
Biggie is a 28-year-old left-handed female with a history of medically refractory epilepsy who was referred for neuropsychological testing as part of a comprehensive presurgical work-up. General cognitive ability is well within normal limits, and there is no evidence of decline from premorbid estimates. No deficits were detected in the domains of attention, processing speed, motor functioning, or visuospatial skills. Although many aspects of executive functioning, language functioning, and memory were within normal limits, she demonstrated mildly inefficient problem solving and hypothesis testing, weaknesses in word retrieval, and inefficiency in new learning of verbal information. There is no evidence of a mood disorder at this time.

In conclusion, the cognitive profile is mildly localizing and lateralizing as there are elements that suggest relative left temporal involvement. That said, there were features seen during testing that suggested mild frontal systems disruption as well. Although Biggie lives alone, she has arranged to have her mother stay with her for a week or two after surgery to help her and provide support in the immediate postacute period. She seems to have a good understanding of and appropriate expectations for the surgery. Taken together with her current asymptomatic mood profile, there are no obvious psychological risk factors for a poor outcome or need for presurgical mental health intervention.

== Diagnostic Impression
<diagnostic-impression>
- 315.00 (F81.0) Specific Learning Disorder, With Impairment in Reading (word reading accuracy, reading rate or fluency, reading comprehension)
- 315.2 (F81.81) Specific Learning Disorder, With Impairment in Written Expression (spelling accuracy)
- 314.01 (F90.9) Unspecified Attention-Deficit/Hyperactivity Disorder (ADHD)

= RECOMMENDATIONS
<recommendations>
== Recommendations for Medical/Healthcare
<recommendations-for-medicalhealthcare>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for School
<recommendations-for-school>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for Home/Family
<recommendations-for-homefamily>
- Rec 1
- Rec 2
- Rec 3

== Recommendations for Follow-Up Evaluation
<recommendations-for-follow-up-evaluation>
- Follow-up assessment is not recommended at this time unless further concerns arise that need to be addressed.

- Follow-up assessment in 12-18 months is recommended to gauge Biggie’s progress and to assess the impact of the above interventions, unless further concerns arise that need to be addressed sooner.

It was a pleasure to work with Biggie. Please contact me with any questions or concerns regarding this patient.

Sincerely,

#image("jwt_sig.png", width: 20%)

#strong[Joey W. Trampush, Ph.D.] \
Assistant Professor of Psychiatry \
Department of Psychiatry and the Behavioral Sciences \
University of Southern California Keck School of Medicine \
CA License PSY29212

#pagebreak()
= APPENDIX
<appendix>
== Test Selection Procedures
<test-selection-procedures>
Neuropsychological tests are intrinsically performance-based, and cognitive performance assessed during this neuropsychological evaluation is summarized above. Where appropriate, qualitative observations are included. Cultural considerations were made when selecting measures, interpreting results, and making diagnostic impressions and recommendations. Results from formal tests are reported in comparison to other individuals the same age, sex, and educational level as range of functioning (e.g., below average, average, above average). Test score labels are intended solely to be descriptive, identifying positions of scores relative to a normal curve distribution, and should be interpreted within the context of the patient’s individual presentation and history. Although standardized scores provide the clinician with an important and necessary understanding of the patient’s test performance compared with a normative group, they do not on their own lead to accurate diagnosis or treatment recommendations.

== Conversion of Test Scores
<conversion-of-test-scores>
#image("tbl_range.png")
