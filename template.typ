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
  doe: [],
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




  doe: [2023-01-01],

)


#let name = [Biggie Smalls]
#let doe = [2023-01-01]
#let patient = [Biggie]
#v(2pt, weak: true)
*PATIENT NAME:* #name \  
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
\#patient was referred for neuropsychological testing as part of a comprehensive work-up for attention-deficit/hyperactivity disorder (ADHD). The results and recommendations were discussed with Biggie during the feedback visit on the final day of the evaluation.will be used in academic and treatment planning.

== Background
<background>
The following information was obtained during an interview with \#patient and from review of available medical records. \#patient has been experiencing symptoms of procrastination, distractibility, and difficulty with organization and time. She has been experiencing these symptoms since childhood, but they have been more problematic in the past few years. She has been able to compensate for her difficulties by working harder and longer than her peers.

Cognitive complaints: sustained attention, working memory, and organization.

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
- Other medications: vitamins, folic acid.
- Appetite/weight: Normal, no changes.
- Sleep: Normal, no changes.
- Alcohol/tobacco: No history of abuse; denied current use.

=== Surgical History
<surgical-history>
Patient denied.

=== Psychiatric History
<psychiatric-history>
Patient denied.

=== Family History
<family-history>
Patient denied a family history of neurological conditions. Her brother was diagnosed with ADHD.

=== Cultural/Social Background
<culturalsocial-background>
\#patient is a Caucasian female who was born and raised in XXXX. She is single, never married, and has no children.

=== Educational History
<educational-history>
\#patient graduated from college and completed some Master’s-level courses. She did not endorse any difficulties with advancing through school.

=== Occupational History
<occupational-history>
\#patient has worked full time as an administrator in a small company. She has maintained this job for the past 6 years.

== Behavioral Observations
<behavioral-observations>
- #emph[Appearance:] Appropriate grooming and dress for context.
- #emph[Behavior/attitude:] Cooperative, engaged.
- #emph[Speech/language:] Fluent and normal in rate, volume, and prosody.
- #emph[Mood/affect:] Neutral, range was full and appropriate.
- #emph[Sensory/motor:] Performance was not limited by any obvious sensory or motor difficulties.
- #emph[Cognitive process:] Coherent and goal directed.
- #emph[Motivation/effort:] Normal.

= NEUROCOGNITIVE FINDINGS
<neurocognitive-findings>
== General Cognitive Ability
<general-cognitive-ability>
Biggie showed particularly strong performance on tests measuring working memory capacity and higher cognitive reasoning, both of which ranked in the Exceptionally High and Above Average ranges respectively. Other estimates of her verbal and visual memory functioning, crystallized intelligence, language comprehension, and premorbid verbal ability level all fell within the Above Average range. These scores suggest that Biggie is highly versatile with regards to her cognitive abilities, particularly in the domains of working memory capacity, higher cognitive reasoning, and verbal/visual memory functioning.

However, attentional function and aggregate performance across metrics of processing speed and cognitive efficiency were categorized as Average. This may pose challenges in her ability to concentrate on tasks, retain instructions, or attend to intricate details. Relative deficiencies in these areas may suggest difficulties in managing time-sensitive tasks or demonstrating self-discipline in routine activities. Such factors could result in challenges when undertaking complex work tasks necessitating efficient multitasking, as well as subtler impairments such as difficulty staying focused during conversations.

#let domain = "General Cognitive Ability"
<qtbl-iq>
#figure([#image("table_iq.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-iq-1.svg", width: 70%)],
  caption: [
    #emph[General Ability] is the overall skill to reason, solve problems, and gain useful knowledge. #emph[Crystallized Knowledge] involves understanding the world through language and reasoning. #emph[Fluid Reasoning] is the logical analysis and solution of new problems, identifying underlying patterns, and applying logic.
  ]
)
<fig-iq>

== Academic Skills
<academic-skills>
Biggie’s broad academic achievement and academic fluency skills fell in the Average range for their age and grade-level. Math fluency, math calculation, and quantitative reasoning were Average to Exceptionally High. Biggie demonstrated Average written expression skills on measures of word spelling and expository writing, and Average writing speed/fluency. By contrast, there were statistically significant and clinically meaningful differences between Biggie’s predicted scores (based on their cognitive ability) and the scores they actually obtained on measures of reading achievement. While reading comprehension stood out as a strength, there were 21-25 point discrepancies between their predicted and obtained scores on the Word Reading subtest and the Reading composite. These differences are significant and so large that they are not commonly found in the general population (2%-5%), indicating a notable personal weakness in reading decoding. A pattern of strengths and weakness (PSW) analysis indicated reduced working memory capacity contributes to Biggie’s low reading scores and very likely constrains learning.

#let domain = "Academic Skills"
<qtbl-academics>
#figure([#image("table_academics.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-academics-1.svg", width: 70%)],
  caption: [
    #emph[Reading ability] consists of three interrelated abilities: decoding, comprehension, and fluency. #emph[Writing ability] can be described in terms of spelling, grammar, expression of ideas, and writing fluency. #emph[Math ability] can be described in terms of calculation skills, applied problem solving, and math fluency.
  ]
)
<fig-academics>

== Verbal/Language
<verballanguage>
Screening of Biggie’s language comprehension and expression skills was intact for their age, demographic background, and educational history. Biggie demonstrated Average phonemic (letters) word fluency and Average semantic (categories) word fluency. Their word-finding ability and retrieval fluency were Average, with no notable dysfluency in informal conversation. Auditory comprehension and rapid reading and color naming tasks were also performed at an Average level.

#let domain = "Verbal/Language"
<qtbl-verbal>
#figure([#image("table_verbal.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-verbal-1.svg", width: 70%)],
  caption: [
    Verbal and language functioning refers to the ability to access and apply acquired word knowledge, to verbalize meaningful concepts, to understand complex multistep instructions, to think about verbal information, and to express oneself using words.
  ]
)
<fig-verbal>

== Visual Perception/Construction
<visual-perceptionconstruction>
Performance across measures of visual perception, construction, motor integration, and spatial navigation of visual/environmental information was Average overall. Visuoperceptual matching requiring close attention to visual detail was Average. Visuoconstruction assembly requiring nonverbal reasoning and quick processing speed was Average. Finally, visuoconstructural drawing/copying of a complex figure requiring visuospatial integration, planning and organization, and efficient encoding of nonverbal material was Average.

#let domain = "Visual Perception/Construction"
<qtbl-spatial>
#figure([#image("table_spatial.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#image("template_files/figure-typst/unnamed-chunk-26-1.svg", width: 70%)

== Attention/Executive
<attentionexecutive>
Formal testing of an array of attention and executive functions revealed heterogeneous skills. A composite index of both basic and complex verbal and nonverbal attentional capacity/functioning was Average. A composite index of higher executive skills was Average. Orientation to person, place, time, and situation was intact. No gross behavioral apathy or disinhibition observed. Auditory attentional capacity was Average (\# digits forward). Working memory for orally presented information was Average (\# digits backward).

#let domain = "Attention/Executive"
<qtbl-executive>
#figure([#image("table_executive.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-executive-1.svg", width: 70%)],
  caption: [
    Attention and executive functions underlie most, if not all, domains of cognitive performance. These are behaviors and skills that allow individuals to successfully carry-out instrumental and social activities, academic work, engage with others effectively, problem solve, and successfully interact with the environment to get needs met.
  ]
)
<fig-executive>

== Memory
<memory>
Learning and recall of rote verbal information (word list) was Average overall. Recall of the list after a short delay was Average. Recall of the list after a long delay was Average, as they was able to recall nearly all the material they had learned. Memory recall of more complex verbal information (short story) was Average for immediate free recall. Delayed recall of the story details was preserved|diminished over time. Learning and recognition of visual material (abstract shapes) was Average. Recognition of the target visual material among non-target distractors after a delay period was Average, suggesting stable memory consolidation over time. Finally, spontaneous, long-term delayed recall (20-25 min) recall and reproduction of a complex abstract figure fell within the Average range.

#let domain = "Memory"
<qtbl-memory>
#figure([#image("table_memory.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-memory-1.svg", width: 70%)],
  caption: [
    Learning and memory refer to the rate and ease with which new information (e. g., facts, stories, lists, faces, names) can be encoded, stored, and later recalled from long-term memory.
  ]
)
<fig-memory>

== Motor
<motor>
All scores in this area were Average. Fine motor speed and dexterity were Average bilaterally. No evidence of atypical lateralization of fine nor gross motor skills. No evidence of dyspraxia. Graphomotor speed and accuracy (i.e., graphomotor control) was intact. Gross motor functioning including balance and gait appeared intact on observation.

#let domain = "Motor"
<qtbl-motor>
#figure([#image("table_motor.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
<fig-motor>
#figure([#image("template_files/figure-typst/fig-motor-1.svg", width: 70%)],
  caption: [
    (a) Sensorimotor Subdomain Plots
  ]
)
<fig-motor>

Sensorimotor tasks refer to the capacity to control hand movements quickly, smoothly, and with adequate precision, which are required to engage in activities such as writing and drawing.

== ADHD/Executive Functioning
<adhdexecutive-functioning>
Biggie completed self-report rating scales of adult ADHD symptoms and executive functioning in everyday life. Consistent and overlapping difficulties were reported in the areas of:

On the companion observer-reports, Mrs. Wallace, Biggie’s mother, reported that Biggie evidences moderate to severe difficulties in the areas of:

#let domain = "ADHD/Executive Functioning"
<qtbl-adhd>
#figure([#image("table_adhd.png", width: 50%)],
  caption: [
    #domain Test Scores
  ],
  kind: "qtbl",
  supplement: [Table],
)
#figure([#image("template_files/figure-typst/fig-adhd-1.svg", width: 70%)],
  caption: [
    Attention and executive functions are multidimensional concepts that contain several related processes. Both concepts require self-regulatory skills and have some common subprocesses; therefore, it is common to treat them together, or even to refer to both processes when talking about one or the other.
  ]
)
<fig-adhd>

== Emotional/Behavioral/Personality
<emotionalbehavioralpersonality>
Biggie completed an objective, self-report inventory of personality and emotional functioning. Given their scores on the validity scales, there are no problems with interpreting the clinical profile. They responded in an open and forthright manner, indicating only modestly elevated levels of stress and anxiety. They seem to have a positive self-image and are likely viewed by others as warm and friendly. There do not appear to be any contributing emotional factors that would account for their current cognitive difficulties.

On the clinical scales, Biggie’s profile revealed no elevations above the clinical skyline that would indicate the presence of clinical psychopathology in the areas that are tapped by the individual clinical scales. Based on interpretation of Biggie’s scores, they reported some preoccupation with physical symptoms and bodily complaints (#emph[elevated SOM-H]); it is possible that they may express `r params$his_her` psychological distress through somatic symptoms. `r params$first_name` reported high perceived stress, a great deal of tension, and having difficulty relaxing (#emph[elevated ANX-A]). They appears to have a tendency to be impulsive and their impulsive behaviors may interfere with interpersonal problems and school functioning (#emph[elevated BOR-S]). As a result of their desire for excitement and stimulation, `r params$first_name` may often become easily bored by routine activities (#emph[elevated ANT-S]). Furthermore, Biggie’s profile suggests `r params$he_she` tends to be egocentric and have little regard for others. Although they may feel guilt over past misbehaviors, `r params$he_she` may feel little long-standing remorse (#emph[elevated ANT-E]). On the NON scales, Biggie’s score suggests they generally feels their family is a source of social support. However, `r params$he_she` may have few close interpersonal relationships. Finally, `r params$first_name`’s RXR score suggests they acknowledges the need to make changes and reports having a generally positive attitude towards making personal change. Given the patient’s diagnosis of ADHD and Mood Disorder, the patient’s personality profile appears to explain some of their classic symptoms such as concentration difficulties, stimulus seeking, irritability, and impulsive behavior.

Biggie completed an objective, self-report inventory of personality and emotional functioning. Given their scores on the validity scales, there are no problems with interpreting the clinical profile. They responded in an open and forthright manner, indicating only modestly elevated levels of stress and anxiety. They seem to have a positive self-image and are likely viewed by others as warm and friendly. There do not appear to be any contributing emotional factors that would account for their current cognitive difficulties.

<fig-emotion>
#figure([#image("template_files/figure-typst/fig-emotion-1.svg", width: 70%)],
  caption: [
    (a) Mood/Self-Report Subdomain Plots
  ]
)
<fig-emotion>

On the clinical scales, `r params$first_name`’s profile revealed no elevations above the clinical skyline that would indicate the presence of clinical psychopathology in the areas that are tapped by the individual clinical scales. Based on interpretation of `r params$first_name`’s scores, `r params$he_she` reported some preoccupation with physical symptoms and bodily complaints (#emph[elevated SOM-H]); it is possible that `r params$he_she` may express `r params$his_her` psychological distress through somatic symptoms. `r params$first_name` reported high perceived stress, a great deal of tension, and having difficulty relaxing (#emph[elevated ANX-A]). `r params$he_she_cap` appears to have a tendency to be impulsive and `r params$his_her` impulsive behaviors may interfere with interpersonal problems and school functioning (#emph[elevated BOR-S]). As a result of `r params$his_her` desire for excitement and stimulation, `r params$first_name` may often become easily bored by routine activities (#emph[elevated ANT-S]). Furthermore, `r params$first_name`’s profile suggests `r params$he_she` tends to be egocentric and have little regard for others. Although `r params$he_she` may feel guilt over past misbehaviors, `r params$he_she` may feel little long-standing remorse (#emph[elevated ANT-E]). On the NON scales, `r params$first_name`’s score suggests `r params$he_she` generally feels `r params$his_her` family is a source of social support. However, `r params$he_she` may have few close interpersonal relationships. Finally, `r params$first_name`’s RXR score suggests `r params$he_she` acknowledges the need to make changes and reports having a generally positive attitude towards making personal change. Given the patient’s diagnosis of ADHD and Mood Disorder, the patient’s personality profile appears to explain some of `r params$his_her` classic symptoms such as concentration difficulties, stimulus seeking, irritability, and impulsive behavior.

#pagebreak()
= SUMMARY/IMPRESSION
<summaryimpression>
#figure([#image("template_files/figure-typst/fig-domain-plot-1.svg")],
  caption: [
    Overall neurocognitive function subdomain plots of \#patient’s strengths and weaknesses. #emph[Note:] #emph[z]-scores have a mean of 0 and a standard deviation of 1.
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
