# Neurotyp Adult — Neuropsychological Report Template

A [Quarto](https://quarto.org/) extension that renders professional adult neuropsychological evaluation reports using [Typst](https://typst.app/). Part of the broader **Neurotyp** ecosystem maintained by [brainworkup](https://brainworkup.org/).

**Version:** 0.2.0 | **Requires:** Quarto ≥ 1.4.0 | **License:** MIT

---

## Overview

`neurotyp-adult` provides a modular Quarto template for generating polished, clinic-ready neuropsychological reports for adult patients. Reports are typeset via Typst and can include:

- Patient demographics and case metadata
- Tests administered
- Neurological symptom evaluation (NSE) narrative
- Behavioral observations
- Cognitive domain findings (dynamically included)
- Summary, impressions, recommendations & findings (SIRF)
- Clinical recommendations
- Clinician signature block
- Appendices

The template integrates with the [`cingulate`](https://github.com/brainworkup/cingulate) R package for data processing, visualization, and AI-assisted narrative generation via a local [Ollama](https://ollama.com/) backend.

---

## Installation

### New project

Use the template to scaffold a new report directory:

```bash
quarto use template brainworkup/neurotyp-adult
```

This installs the extension and copies `template.qmd` as a starting point.

### Existing project

Add the extension (format only, without the template file) to an existing project:

```bash
quarto add brainworkup/neurotyp-adult
```

### Update

Pull the latest version of the extension:

```bash
quarto update extension brainworkup/neurotyp-adult
```

---

## Usage

1. **Configure patient metadata** in your `.qmd` YAML front matter:

   ```yaml
   ---
   title: NEUROCOGNITIVE EXAMINATION
   patient: Doe
   name: Doe, Jane
   dob: "1980-01-15"
   age: 45
   doe: "2025-03-10"
   doe2: "2025-03-11"
   doe3: "2025-03-12"
   date_of_report: last-modified
   case_number: "2025-001"
   ---
   ```

2. **Populate section files** — the template includes the following modular `.qmd` files that you populate with patient-specific content:

   | File | Section |
   |------|---------|
   | `_00-00_tests.qmd` | Tests administered |
   | `_01-00_nse.qmd` | Neurological symptom evaluation |
   | `_01-01_behav_obs.qmd` | Behavioral observations |
   | `_domains_to_include.qmd` | Cognitive domain findings (dynamic) |
   | `_03-00_sirf.qmd` | Summary, impressions, recommendations & findings |
   | `_03-00_sirf_text.qmd` | SIRF narrative text |
   | `_03-01_recs.qmd` | Clinical recommendations |
   | `_03-02_signature.qmd` | Clinician signature |
   | `_03-03_appendix.qmd` | Appendices |

3. **Render the report:**

   ```bash
   quarto render template.qmd
   ```

   This produces a PDF via Typst.

---

## Template Structure

```
neurotyp-adult/
├── _extensions/
│   └── neurotyp-adult/
│       ├── _extension.yml       # Extension metadata (v0.2.0)
│       ├── typst-template.typ   # Typst page layout & header rules
│       └── typst-show.typ       # Typst show rules & typography
├── _brand/
│   └── _brand.yml               # Brand colors, fonts & logo config
├── template.qmd                 # Master report template
├── LICENSE
└── README.md
```

### Typst formatting highlights

- A4 page with 30 mm top margin and 25 mm side margins
- Pages 2+ automatically display a **CONFIDENTIAL** header with patient name and date
- Justified body text; centered level-0 headings
- Preferred fonts: IBM Plex Sans/Serif, Source Sans 3, JetBrains Mono (falls back gracefully if unavailable)

---

## Dependencies

| Requirement | Notes |
|-------------|-------|
| [Quarto](https://quarto.org/) ≥ 1.4.0 | Document engine |
| [Typst](https://typst.app/) | PDF rendering (bundled with Quarto) |
| R + [`neuro2`](https://github.com/brainworkup/NeurotypR) | Data processing & visualization |
| [Ollama](https://ollama.com/) *(optional)* | Local LLM backend for AI-assisted narratives |

Key R packages used inside the template: `dplyr`, `readr`, `here`, `yaml`, `ggplot2`, `systemfonts`.

---

## Related Projects

| Repo | Description |
|------|-------------|
| [`brainworkup/neurotyp-pediatric`](https://github.com/brainworkup/neurotyp-pediatric) | Pediatric report template |
| [`brainworkup/neurotyp-forensic`](https://github.com/brainworkup/neurotyp-forensic) | Forensic evaluation template |
| [`brainworkup/NeurotypR`](https://github.com/brainworkup/NeurotypR) | Core R package (`neuro2`) |

---

## Author

**Joey W. Trampush, Ph.D.**  
Brainworkup Institute  
[joey.trampush@brainworkup.org](mailto:joey.trampush@brainworkup.org)

---

## License

MIT © 2023 Joey Trampush
