# AATEC_fMRI: Approach Avoidance Training vs Evaluative Conditioning 

**Author:** Anoushiravan Zahedi  
**Repository:** [https://github.com/anoushzahedi/AATEC](https://github.com/anoushzahedi/AATEC_fMRI)

## Overview
AATEC is a MATLAB-based experimental suite developed using **Psychtoolbox-3**. It utilizes a within-subject design to investigate decision-making, preference formation, and attentional biases. 

This version is specifically optimized for **fMRI environments**, supporting synchronized timing and specialized input hardware including **joysticks** and **MRI-compatible response boxes**.

---

## Experimental Structure

The behavioral measurement is divided into three distinct phases:

### Phase 1: Baseline Preference & Choice
1. **Willingness to Pay (WTP)**: Participants evaluate toy images individually and indicate their valuation on a continuous scale.
2. **Binary Choice Task**: Participants perform a simple "Yes/No" choice for each presented item to establish baseline preference.

### Phase 2: Attentional & Affective Training
1. **Approach/Avoid Task (Sound-Cued)**: A sensorimotor task where participants must approach or avoid toys based on auditory cues (e.g., high vs. low pitch).
2. **Emotion Categorization Task**: A speeded task requiring participants to categorize emotional stimuli, used to measure affective processing speed and bias.

### Phase 3: Post-Training Evaluation
1. **Willingness to Pay (WTP)**: Re-evaluation of items to measure valuation shifts.
2. **Binary Choice Task**: Re-evaluation of choice consistency.
3. **Competitive Choice Task**: A forced-choice paradigm where two options are presented simultaneously, and participants must select their preferred item.

---

## Technical Specifications & Compatibility

### Hardware Support
- **fMRI Compatible**: Designed for use in MRI environments with precise timing synchronization.
- **Input Devices**: 
  - Supports standard and MRI-compatible **Joysticks**.
  - Supports **MRI Response Boxes** for binary and Likert-scale inputs.
- **Software Requirements**: MATLAB with Psychtoolbox-3 installed.

### Critical Constraints
- **Attention Monitoring**: The study includes multiple embedded attention checks.
- **Timeout Protocol**: To ensure data quality and participant engagement, the experiment includes an automatic termination script if the participant remains unresponsive for more than **3 minutes**.

---

## Installation & Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/anoushzahedi/AATEC_fMRI.git
   ```
2. Open MATLAB and add the repository folder to your path.
3. Ensure Psychtoolbox-3 is correctly configured (`SetupPsychtoolbox`).
4. Run the main experimental script (ensure your input device is connected and recognized by MATLAB).

## License
This project is licensed under the MIT License - see the LICENSE file for details.
