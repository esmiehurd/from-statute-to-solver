(declare-const base_offense_level Int)
(declare-const offense_level Int)

(declare-const offense_D Bool)
(declare-const offense_D1 Bool)
(declare-const offense_D1.1 Bool)
(declare-const offense_D1.2 Bool)
(declare-const offense_D1.5 Bool)
(declare-const offense_D1.6 Bool)
(declare-const offense_D1.7 Bool)
(declare-const offense_D1.8 Bool)
(declare-const offense_D1.9 Bool)
(declare-const offense_D1.10 Bool)
(declare-const offense_D1.11 Bool)
(declare-const offense_D1.12 Bool)
(declare-const offense_D1.13 Bool)
(declare-const offense_D1.14 Bool)

(assert (=> offense_D offense_D1))
(assert (=> offense_D1 offense_D))

(assert (=> offense_D1 (or offense_D1.1 offense_D1.2 offense_D1.5 offense_D1.6 offense_D1.7 offense_D1.8 offense_D1.9 offense_D1.10 offense_D1.11 offense_D1.12 offense_D1.13 offense_D1.14)))
(assert (=> (or offense_D1.1 offense_D1.2 offense_D1.5 offense_D1.6 offense_D1.7 offense_D1.8 offense_D1.9 offense_D1.10 offense_D1.11 offense_D1.12 offense_D1.13 offense_D1.14) offense_D1))

; 2D1.1
; constants
(declare-const law_21_USC_841_b_1_A Bool)
(declare-const law_21_USC_841_b_1_B Bool)
(declare-const law_21_USC_841_b_1_C Bool)
(declare-const law_21_USC_960_b_1 Bool)
(declare-const law_21_USC_960_b_2 Bool)
(declare-const law_21_USC_960_b_3 Bool)
(declare-const statutory_term_life Bool)
(declare-const statutory_term Int)
(declare-const stipulate_offense_2D1.1_a1 Bool)
(declare-const stipulate_level_2D1.1_a1 Bool)
(declare-const stipulate_offense_2D1.1_a2 Bool)
(declare-const stipulate_level_2D1.1_a2 Bool)
(declare-const law_21_USC_841_b_1_E Bool)
(declare-const law_21_USC_960_b_5 Bool)
(declare-const statutory_maximum Int) ; repeat
(declare-const stipulate_offense_2D1.1_a3 Bool)
(declare-const stipulate_level_2D1.1_a3 Bool)
(declare-const stipulate_offense_2D1.1_a4 Bool)
(declare-const stipulate_level_2D1.1_a4 Bool)
(declare-const drug_quantity_table_category Int)
(declare-const drug_quantity_table_base_offense_level Int)
(declare-const offense_D1.1_a5_level Int)
(declare-const mitigating Bool) ; repeat
(declare-const minimal Bool) ; repeat

(declare-const dangerous_weapon_posession Bool) ; repeat

(declare-const violence Bool)

(declare-const imported_exported_controlled_substance Bool)
(declare-const irregular_aircraft Bool)
(declare-const law_18_USC_2285 Bool)
(declare-const operation_officer Bool)

(declare-const prison_correctional_detention_facility Bool)

(declare-const amphetamine_methamphetamine Bool)

(declare-const law_21_USC_865 Bool)

(declare-const controlled_substance_mass_marketing_computer Bool)

(declare-const anabolic_steroid Bool)
(declare-const masking_agent Bool)

(declare-const anabolic_steroid_athlete Bool)

(declare-const law_21_USC_841_g_1_A Bool)

(declare-const bribe_law_enforcement Bool)

(declare-const premises_manufacturing_or_distributing Bool)

(declare-const knowingly_misrepresented_marketed_fentanyl Bool)
(declare-const represented_fentanyl_as_real_drug Bool)
(declare-const willful_blindness_avoidance Bool)

(declare-const harmful_environment_discharge Bool)
(declare-const unlawful_treatment_hazardous_waste Bool)
(declare-const law_21_USC_860_a Bool)
(declare-const distribute_methamphetamine_minor Bool)
(declare-const manufacture_methamphetamine_minor Bool)
(declare-const manufacture_methamphetamine Bool)
(declare-const manufacture_amphetamine Bool)
(declare-const risk_of_harm_to_human_life Bool)
(declare-const risk_of_harm_to_minor_incompetent Bool)
(declare-const risk_of_harm_to_environment Bool)

(declare-const cultivating_marijuana_state_federal_land Bool)
(declare-const cultivating_marijuana_tribal_private_land Bool)
(declare-const aggrivating Bool) ; repeat

(declare-const use_of_fear_controlled_substances Bool)
(declare-const use_of_impulse_controlled_substances Bool)
(declare-const use_of_friendship_controlled_substances Bool)
(declare-const use_of_affection_controlled_substances Bool)
(declare-const individual_received_minimal_compensation Bool)
(declare-const individual_had_minimal_knowledge Bool)
(declare-const individual_age Int)
(declare-const individual_pregnant Bool)
(declare-const individual_unusually_vulnerable Bool)
(declare-const directly_involved_in_importation_of_controlled_substance Bool)
(declare-const witness_intimidation Bool)
(declare-const tampered_or_destroyed_evidence Bool)
(declare-const obstructed_justice_in_investigation Bool)
(declare-const pattern_of_criminal_conduct Bool)

(declare-const motivated_by_intimate_or_familial_relationship Bool)
(declare-const motivated_by_threats_or_fear Bool)
(declare-const otherwise_unlikely_to_commit_offense Bool)
(declare-const received_monetary_compensation Bool)
(declare-const minimal_knowledge Bool)

(declare-const limitation_C1.2_a Bool)

; relationships
(assert (= drug_quantity_table_base_offense_level (* (- 20 drug_quantity_table_category) 2)))
(assert (>= statutory_maximum statutory_term))
(assert (=> anabolic_steroid_athlete anabolic_steroid))
(assert (=> (or distribute_methamphetamine_minor manufacture_methamphetamine_minor) law_21_USC_860_a))
(assert (=> manufacture_methamphetamine_minor manufacture_methamphetamine))
(assert (=> risk_of_harm_to_minor_incompetent risk_of_harm_to_human_life))

; base offense level
(assert (ite mitigating
            (and
                (=> (= drug_quantity_table_base_offense_level 32) (= offense_D1.1_a5_level 30))
                (=> (or (= drug_quantity_table_base_offense_level 36) (= drug_quantity_table_base_offense_level)) (ite minimal (= offense_D1.1_a5_level 32) (= offense_D1.1_a5_level 33)))
                (=> (= drug_quantity_table_base_offense_level 38) (ite minimal (= offense_D1.1_a5_level 32) (= offense_D1.1_a5_level 34))))
            (= offense_D1.1_a5_level drug_quantity_table_base_offense_level)))

(assert (=> offense_D1.1
    (ite (or 
            (and statutory_term_life (or law_21_USC_841_b_1_A law_21_USC_841_b_1_B law_21_USC_841_b_1_C law_21_USC_960_b_1 law_21_USC_960_b_2 law_21_USC_960_b_3))
            (or stipulate_offense_2D1.1_a1 stipulate_level_2D1.1_a1))
        (= base_offense_level 43)
        (ite (and (or 
                    (and (>= statutory_term 20) (or law_21_USC_841_b_1_A law_21_USC_841_b_1_B law_21_USC_841_b_1_C law_21_USC_960_b_1 law_21_USC_960_b_2 law_21_USC_960_b_3))
                    (or stipulate_offense_2D1.1_a2 stipulate_level_2D1.1_a2))
                (< offense_D1.1_a5_level 38))
            (= base_offense_level 38)
            (ite (and (or
                        (and (= statutory_maximum 30) (or law_21_USC_841_b_1_E law_21_USC_960_b_5))
                        (or stipulate_offense_2D1.1_a3 stipulate_level_2D1.1_a3))
                    (< offense_D1.1_a5_level 30))
                (= base_offense_level 30)
                (ite (and (or
                            (and (= statutory_maximum 15) (or law_21_USC_841_b_1_E law_21_USC_960_b_5))
                            (or stipulate_offense_2D1.1_a4 stipulate_level_2D1.1_a4))
                        (< offense_D1.1_a5_level 26))
                    (= base_offense_level 26)
                    (= base_offense_level offense_D1.1_a5_level)))))))

; specific offense characteristics
(define-fun offense_D1.1_SOC_1 ((old Int)) Int
    (ite dangerous_weapon_posession
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_2 ((old Int)) Int
    (ite violence
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_3 ((old Int)) Int
    (ite (and imported_exported_controlled_substance (or irregular_aircraft law_18_USC_2285 operation_officer))
        (ite (< (+ old 2) 26)
            26
            (+ old 2))
        old))

(define-fun offense_D1.1_SOC_4 ((old Int)) Int
    (ite prison_correctional_detention_facility
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_5 ((old Int)) Int
    (ite (and amphetamine_methamphetamine (not mitigating))
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_6 ((old Int)) Int
    (ite law_21_USC_865
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_7 ((old Int)) Int
    (ite controlled_substance_mass_marketing_computer
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_8 ((old Int)) Int
    (ite (and anabolic_steroid masking_agent)
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_9 ((old Int)) Int
    (ite anabolic_steroid_athlete
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_10 ((old Int)) Int
    (ite law_21_USC_841_g_1_A
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_11 ((old Int)) Int
    (ite bribe_law_enforcement
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_12 ((old Int)) Int
    (ite premises_manufacturing_or_distributing
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_13 ((old Int)) Int
    (ite knowingly_misrepresented_marketed_fentanyl
        (+ old 4)
        (ite (and represented_fentanyl_as_real_drug willful_blindness_avoidance)
            (+ old 2)
            old)))
(define-fun offense_D1.1_SOC_14_A ((old Int)) Int
    (ite (or harmful_environment_discharge unlawful_treatment_hazardous_waste)
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_14_B ((old Int)) Int
    (ite (and law_21_USC_860_a distribute_methamphetamine_minor)
        (ite (< (+ old 2) 14)
            14
            (+ old 2))
        old))

(define-fun offense_D1.1_SOC_14_C ((old Int)) Int
    (ite (or (and law_21_USC_860_a manufacture_methamphetamine_minor)
            (and (or manufacture_amphetamine manufacture_methamphetamine)
                (or risk_of_harm_to_human_life risk_of_harm_to_environment)
                (not risk_of_harm_to_minor_incompetent)))
        (ite (< (+ old 3) 27)
            27
            (+ old 3))
        old))

(define-fun offense_D1.1_SOC_14_D ((old Int)) Int
    (ite (and (or manufacture_amphetamine manufacture_methamphetamine) risk_of_harm_to_minor_incompetent)
        (ite (< (+ old 6) 30)
            30
            (+ old 6))
        old))

(define-fun offense_D1.1_SOC_14 ((old Int)) Int
    (ite (< (offense_D1.1_SOC_14_C old) (offense_D1.1_SOC_14_D old))
        (offense_D1.1_SOC_14_D old)
        (ite (< (offense_D1.1_SOC_14_B old) (offense_D1.1_SOC_14_C old))
            (offense_D1.1_SOC_14_C old)
            (ite (< (offense_D1.1_SOC_14_A old) (offense_D1.1_SOC_14_B old))
                (offense_D1.1_SOC_14_B old)
                (offense_D1.1_SOC_14_A old)))))

(define-fun offense_D1.1_SOC_15 ((old Int)) Int
    (ite (and aggrivating (or cultivating_marijuana_state_federal_land cultivating_marijuana_tribal_private_land))
        (+ old 2)
        old))

(define-fun offense_D1.1_SOC_16 ((old Int)) Int
    (ite (or (and (or use_of_fear_controlled_substances use_of_impulse_controlled_substances use_of_friendship_controlled_substances use_of_affection_controlled_substances)
                individual_received_minimal_compensation
                individual_had_minimal_knowledge)
            (or (< individual_age 18)
                (>= individual_age 65)
                individual_pregnant
                individual_unusually_vulnerable)
            directly_involved_in_importation_of_controlled_substance
            (or witness_intimidation
                tampered_or_destroyed_evidence
                obstructed_justice_in_investigation)
            pattern_of_criminal_conduct)
        (+ old 2)
        old))


(define-fun offense_D1.1_SOC_17 ((old Int)) Int
    (ite (and minimal
            (and (and (or motivated_by_intimate_or_familial_relationship motivated_by_threats_or_fear) otherwise_unlikely_to_commit_offense)
                (not received_monetary_compensation)
                minimal_knowledge))
        (- old 2)
        old))

(define-fun offense_D1.1_SOC_18 ((old Int)) Int
    (ite limitation_C1.2_a
        (- old 2)
        old))

; apply specific offense characteristics
(assert (=> offense_D1.1 (= offense_level
    (offense_D1.1_SOC_18
        (offense_D1.1_SOC_17
            (offense_D1.1_SOC_16
                (offense_D1.1_SOC_15
                    (offense_D1.1_SOC_14
                        (offense_D1.1_SOC_13
                            (offense_D1.1_SOC_12
                                (offense_D1.1_SOC_11
                                    (offense_D1.1_SOC_10
                                        (offense_D1.1_SOC_9
                                            (offense_D1.1_SOC_8
                                                (offense_D1.1_SOC_7
                                                    (offense_D1.1_SOC_6
                                                        (offense_D1.1_SOC_5
                                                            (offense_D1.1_SOC_4
                                                                (offense_D1.1_SOC_3
                                                                    (offense_D1.1_SOC_2
                                                                        (offense_D1.1_SOC_10 base_offense_level)))))))))))))))))))))

(check-sat)