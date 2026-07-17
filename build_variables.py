#!/usr/bin/env python3
"""
Generate _variables.yml from config.patient.yml

Usage:
    python3 build_variables.py config.patient.yml
    python3 build_variables.py config.patient.yml --output _variables.yml
"""

import yaml
import argparse
from pathlib import Path


def build_variables(config_path, output_path="_variables.yml"):
    """Load config.patient.yml and generate _variables.yml"""

    # Load config
    with open(config_path) as f:
        config = yaml.safe_load(f)

    # Extract all nested sections into flat _variables.yml
    variables = {
        "version": "0.4.0",
        # Patient info
        "patient": config["patient"]["name"],
        "first_name": config["patient"]["first_name"],
        "last_name": config["patient"]["last_name"],
        "name": f"{config['patient']['last_name']}, {config['patient']['first_name']}",
        "age": config["patient"]["age"],
        "age_group": config["patient"]["age_group"],
        "dob": config["patient"]["dob"],
        "sex": config["patient"]["sex"],
        "sex_cap": config["patient"]["sex_cap"],
        "handedness": config["patient"]["handedness"],
        "education": config["patient"]["education"],
        "case_number": config["patient"]["case_number"],
        # Pronouns
        "pronouns": config["patient"]["pronouns"],
        "he_she": config["patient"]["he_she"],
        "he_she_cap": config["patient"]["he_she_cap"],
        "his_her": config["patient"]["his_her"],
        "his_her_cap": config["patient"]["his_her_cap"],
        "him_her": config["patient"]["him_her"],
        "him_her_cap": config["patient"]["him_her_cap"],
        # Evaluation
        "doe": config["evaluation"]["doe_primary"],
        "doe2": config["evaluation"]["doe_secondary"],
        "doe3": config["evaluation"]["doe_tertiary"],
        "date_of_report": config["evaluation"]["date_of_report"],
        # Provider
        "clinician": config["provider"]["clinician"],
        "clinic_name": config["provider"]["clinic_name"],
        "clinic_address": config["provider"]["clinic_address"],
        "attorney": config["provider"]["attorney"],
        "referral": config["provider"]["referral_source"],
        "observer": config["provider"]["observer"],
        "observer_relation": config["provider"]["observer_relation"],
        # Diagnoses
        "dx1": config["diagnoses"]["primary"],
        "dx2": config["diagnoses"]["secondary"],
        "dx3": config["diagnoses"]["tertiary"],
        # Report options
        "include_summary": config["report"]["include_summary"],
        "include_recommendations": config["report"]["include_recommendations"],
        "include_scores_table": config["report"]["include_scores_table"],
    }

    # Write _variables.yml
    with open(output_path, "w") as f:
        yaml.dump(variables, f, default_flow_style=False, sort_keys=False)

    print(f"✓ Generated {output_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("config", help="Path to config.patient.yml")
    parser.add_argument("--output", default="_variables.yml")
    args = parser.parse_args()

    build_variables(args.config, args.output)
