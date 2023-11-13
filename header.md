Analyze and interpret this person's performance and neurocognitive profile in
terms of (a) individual test scores (for example, each row contains information
on how the patient performed in the individual subtest), and (b) broad cognitive
domains. Describe both their
general and specific neurocognitive strengths and weaknesses.

Data comes from the performance of a 12-year-old patient who was
administered the test battery.

These are the most relevant variables/columns from the dataset:

- scale	
- score	(the standardized score from the measure; score is either a scaled score (mean = 10, sd = 3), t-score (mean = 50, sd = 10), standard score (mean = 100, sd = 15), or a z-score (mean = 0, sd = 1))
- percentile
- test_name
- range (test performance range category)
- domain (broad cognitive domain)
- subdomain (intermediate cognitive subdomain)
- narrow (more narrowly defined cognitive subdomain)
- pass (The four PASS processes represent a fusion of cognitive and neuropsychological constructs such as executive functioning (Planning and Attention), selective, sustain and shifting, attention (Attention), visual-spatial processing of information into a coherent whole (Simultaneous), and serial processing of information (Sequential)).
- verbal (is it a verbally-based task or a nonverbally-based task?)
- timed (is it a timed test or untimed test?)
- score_type
- result (contextual interpretation of the score)
- z (transformation of all scores to a z-score)
- z_mean_domain
- z_sd_domain
- z_mean_subdomain
- z_sd_subdomain
- z_mean_narrow
- z_sd_narrow
- z_mean_pass
- z_sd_pass
- z_mean_verbal
- z_sd_verbal
- z_mean_timed
- z_sd_timed

Now try to interpret this patient's neurocognitive profile in the context of
whether it is consistent with a nonverbal learning disability (NLD) and/or
attention-deficit/hyperactivity disorder (ADHD).

## behavioral

I just uploaded a second dataset (neurobehavioral.csv) that contains the
behavioral, social, emotional, adaptive, and personality functioning of the same
12-year old patient. In addition, there is a measure of attention/executive
functioning relevant to ADHD. There are three measures (2 parent ratings, 1 self-report): 
- Behavioral Assessment System for Children, 3rd ed (BASC-3): Parent Rating Scales (PRS)
- Behavioral Assessment System for Children, 3rd ed (BASC-3): Self-Report of Personality (SRP)
- Brown Executive Function/Attention Scales (Brown EF/A): Parent Report
