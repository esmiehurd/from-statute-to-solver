;; ========== BASE STRUCTURE ==========
(declare-const base_offense_level Int)
(declare-const offense_level Int)

;; ========== OFFENSE TYPES ==========
(declare-const offense_A Bool)

(declare-const offense_A1 Bool)
(declare-const offense_A1.1 Bool)
(declare-const offense_A1.2 Bool)
(declare-const offense_A1.3 Bool)
(declare-const offense_A1.4 Bool)
(declare-const offense_A1.5 Bool)

(declare-const offense_A2 Bool)
(declare-const offense_A2.1 Bool)
(declare-const offense_A2.2 Bool)
(declare-const offense_A2.3 Bool)
(declare-const offense_A2.4 Bool)

(declare-const offense_A3 Bool)
(declare-const offense_A3.1 Bool)
(declare-const offense_A3.2 Bool)
(declare-const offense_A3.3 Bool)
(declare-const offense_A3.4 Bool)
(declare-const offense_A3.5 Bool)
(declare-const offense_A3.6 Bool)

(declare-const offense_A4 Bool)
(declare-const offense_A4.1 Bool)
(declare-const offense_A4.2 Bool)

(declare-const offense_A5 Bool)
(declare-const offense_A5.1 Bool)
(declare-const offense_A5.2 Bool)
(declare-const offense_A5.3 Bool)

(declare-const offense_A6 Bool)
(declare-const offense_A6.1 Bool)
(declare-const offense_A6.2 Bool)

(assert (=> offense_A (= 1 (+
    (ite offense_A1 1 0)
    (ite offense_A2 1 0)
    (ite offense_A3 1 0)
    (ite offense_A4 1 0)
    (ite offense_A5 1 0)
    (ite offense_A6 1 0)))))

(assert (=> offense_A1 (= 1 (+
    (ite offense_A1.1 1 0)
    (ite offense_A1.2 1 0)
    (ite offense_A1.3 1 0)
    (ite offense_A1.4 1 0)
    (ite offense_A1.5 1 0)))))

(assert (=> offense_A2 (= 1 (+
    (ite offense_A2.1 1 0)
    (ite offense_A2.2 1 0)
    (ite offense_A2.3 1 0)
    (ite offense_A2.4 1 0)))))

(assert (=> offense_A3 (= 1 (+
    (ite offense_A3.1 1 0)
    (ite offense_A3.2 1 0)
    (ite offense_A3.3 1 0)
    (ite offense_A3.4 1 0)
    (ite offense_A3.5 1 0)
    (ite offense_A3.6 1 0)))))

(assert (= offense_A4 (xor offense_A4.1 offense_A4.2)))

(assert (=> offense_A5 (= 1 (+
    (ite offense_A5.1 1 0)
    (ite offense_A5.2 1 0)
    (ite offense_A5.3 1 0)))))

(assert (= offense_A6 (xor offense_A6.1 offense_A6.2)))

;; ========== SHARED CONSTANTS ==========
(declare-const physical_contact Bool)
(declare-const death Bool)
(declare-const attempted_murder Bool)
(declare-const pecuniary_value Bool)
(declare-const reckless_conduct Bool)
(declare-const reckless_transportation Bool)

(declare-const first_degree_murder_object Bool)
(declare-const bodily_injury Bool)
(declare-const substantial_bodily_injury Bool)
(declare-const serious_bodily_injury Bool)
(declare-const medium_injury Bool)
(declare-const between_serious_and_permanent_injury Bool)
(declare-const permanent_or_life_threatening_injury Bool)
(declare-const more_than_minimal_planning Bool)
(declare-const firearm_discharged Bool)
(declare-const dangerous_weapon_used Bool)
(declare-const dangerous_weapon_threatened Bool)
(declare-const dangerous_weapon_possessed Bool)
(declare-const intimate_partner Bool)
(declare-const strangulation Bool)
(declare-const violated_court_order Bool)
(declare-const law_18_USC_111_b Bool)
(declare-const law_18_USC_115 Bool)
(declare-const victim_age Int)

(declare-const law_18_USC_2241_c Bool)
(declare-const law_18_USC_2241_a Bool)
(declare-const law_18_USC_2241_b Bool)
(declare-const victim_in_defendant_custody Bool)
(declare-const victim_in_correctional_custody Bool)
(declare-const victim_abducted Bool)
(declare-const misrepresentation_of_identity Bool)
(declare-const used_computer Bool)
(declare-const undue_influence Bool)
(declare-const law_18_USC_2242 Bool)
(declare-const tier_I Bool)
(declare-const tier_II Bool)
(declare-const tier_III Bool)
(declare-const committed_sex_offense_nonminor Bool)
(declare-const committed_felony_against_minor Bool)
(declare-const committed_sex_offense_against_minor Bool)
(declare-const voluntarily_corrected_registration Bool)
(declare-const attempted_to_register_prevented_by_circumstances Bool)
(declare-const defendant_contributed_to_circumstances Bool)
(declare-const law_18_USC_2250_d Bool)
(declare-const law_18_USC_2260A Bool)

(declare-const ransom_demand Bool)
(declare-const release_day Int)
(declare-const victim_sexually_exploited Bool)
(declare-const victim_transferred_for_money Bool)
(declare-const other_offense_applies Bool)
(declare-const other_offense_level Int)
(declare-const other_offense_accounts_for_kidnapping Bool)

(declare-const intentional_endangerment Bool)
(declare-const reckless_endangerment Bool)
(declare-const assault_occurred Bool)
(declare-const assault_offense_level Int)
(declare-const underlying_offense_level Int)

(declare-const law_47_USC_223_a_1_C Bool)
(declare-const law_47_USC_223_a_1_D Bool)
(declare-const law_47_USC_223_a_1_E Bool)
(declare-const threat_to_injure Bool)
(declare-const intent_to_carry_out_threat Bool)
(declare-const number_of_threats Int)
(declare-const law_18_USC_1521 Bool)
(declare-const number_of_false_liens_encumbrances Int)
(declare-const caused_public_disruption Bool)
(declare-const caused_substantial_expenditure Bool)
(declare-const public_threat Bool)
(declare-const incited_violation_of_115 Bool)
(declare-const low_deliberation Bool)
(declare-const stalking_pattern Bool)

;; ========== RELATIONSHIPS ==========
(assert (= bodily_injury (or serious_bodily_injury medium_injury between_serious_and_permanent_injury permanent_or_life_threatening_injury)))
(assert (=> (or dangerous_weapon_threatened dangerous_weapon_used) dangerous_weapon_possessed))
(assert (>= number_of_threats))
(assert (=> offense_A6.1 (> number_of_threats 0)))

;; ========== SECTION 2A1: HOMICIDE ==========

;; §2A1.1 - First Degree Murder
(assert (=> offense_A1.1 (= base_offense_level 43)))
(assert (=> offense_A1.1 (= offense_level base_offense_level)))

;; §2A1.2 - Second Degree Murder
(assert (=> offense_A1.2 (= base_offense_level 38)))
(assert (=> offense_A1.2 (= offense_level base_offense_level)))

;; §2A1.3 - Voluntary Manslaughter
(assert (=> offense_A1.3 (= base_offense_level 29)))
(assert (=> offense_A1.3 (= offense_level base_offense_level)))

;; §2A1.4 - Involuntary Manslaughter
(assert (=> reckless_transportation reckless_conduct))

(assert (=> offense_A1.4
    (ite (not reckless_conduct) (= base_offense_level 12)
         (ite (not reckless_transportation) (= base_offense_level 18)
              (= base_offense_level 22)))))

(assert (=> offense_A1.4 (= offense_level base_offense_level)))

;; §2A1.5 - Conspiracy or Solicitation to Commit Murder
(assert (=> offense_A1.5 (= base_offense_level 33)))

(define-fun offense_A1.5_SOC_1 ((old Int)) Int
    (ite pecuniary_value (+ old 4) old))

(assert (=> offense_A1.5 (= offense_level (offense_A1.5_SOC_1 base_offense_level))))

(assert (=> (or offense_A1.1 offense_A1.2 offense_A1.3 offense_A1.4) death))

;; ========== SECTION 2A2: ASSAULT ==========

;; §2A2.1 - Assault with Intent to Commit Murder; Attempted Murder
(assert (=> offense_A2.1
    (ite first_degree_murder_object (= base_offense_level 33)
         (= base_offense_level 27))))

(define-fun offense_A2.1_SOC_1 ((old Int)) Int
    (ite permanent_or_life_threatening_injury (+ old 4)
        (ite medium_injury (+ old 3)
            (ite serious_bodily_injury (+ old 2)
                 old))))

(define-fun offense_A2.1_SOC_2 ((old Int)) Int
    (ite pecuniary_value (+ old 4) old))

(assert (=> offense_A2.1 (= offense_level
    (offense_A2.1_SOC_1
        (offense_A2.1_SOC_2 base_offense_level)))))

;; §2A2.2 - Aggravated Assault
(assert (=> offense_A2.2 (= base_offense_level 14)))

(define-fun offense_A2.2_SOC_1 ((old Int)) Int
    (ite more_than_minimal_planning (+ old 2) old))

(define-fun offense_A2.2_SOC_2 ((old Int)) Int
    (ite firearm_discharged (+ old 5)
        (ite dangerous_weapon_used (+ old 4)
            (ite dangerous_weapon_threatened (+ old 3)
                old))))

(define-fun offense_A2.2_SOC_3 ((old Int)) Int
    (ite permanent_or_life_threatening_injury (+ old 7)
        (ite between_serious_and_permanent_injury (+ old 6)
            (ite serious_bodily_injury (+ old 5)
                (ite medium_injury (+ old 4)
                    (ite bodily_injury (+ old 3)
                        old))))))

(define-fun offense_A2.2_SOC_2_3_combined ((old Int)) Int
    (ite (> (offense_A2.2_SOC_3 (offense_A2.2_SOC_2 old)) (+ old 10))
        (+ old 10)
        (offense_A2.2_SOC_3 (offense_A2.2_SOC_2 old))))
        

(define-fun offense_A2.2_SOC_4 ((old Int)) Int
    (ite (and intimate_partner strangulation) (+ old 3) old))

(define-fun offense_A2.2_SOC_2_3_4_combined ((old Int)) Int
    (ite (> (offense_A2.2_SOC_4 (offense_A2.2_SOC_2_3_combined old)) (+ old 12))
        (+ old 12)
        (offense_A2.2_SOC_4 (offense_A2.2_SOC_3 (offense_A2.2_SOC_2 old)))))

(define-fun offense_A2.2_SOC_5 ((old Int)) Int
    (ite pecuniary_value (+ old 2) old))

(define-fun offense_A2.2_SOC_6 ((old Int)) Int
    (ite violated_court_order (+ old 2) old))

(define-fun offense_A2.2_SOC_7 ((old Int)) Int
     (ite (or law_18_USC_111_b law_18_USC_115) (+ old 2) old))

(assert (=> offense_A2.2 (= offense_level
    (offense_A2.2_SOC_7
        (offense_A2.2_SOC_6
            (offense_A2.2_SOC_5 
                (offense_A2.2_SOC_2_3_4_combined
                    (offense_A2.2_SOC_1 base_offense_level))))))))

;; §2A2.3 - Simple Assault
(assert (=> offense_A2.3
    (ite (or physical_contact dangerous_weapon_threatened)
         (= base_offense_level 7)
         (= base_offense_level 4))))

(define-fun offense_A2.3_SOC_1 ((old Int)) Int
    (ite bodily_injury
        (+ old 2)
        (ite (and substantial_bodily_injury
                (or intimate_partner (< victim_age 16)))
            (+ old 4)
             old)))

(assert (=> offense_A2.3 (= offense_level (offense_A2.3_SOC_1 base_offense_level))))

;; §2A2.4 - Obstructing or Impeding Officers
(assert (=> offense_A2.4 (= base_offense_level 10)))

(define-fun offense_A2.4_SOC_1 ((old Int)) Int
    (ite (or physical_contact dangerous_weapon_threatened) (+ old 3) old))

(define-fun offense_A2.4_SOC_2 ((old Int)) Int
    (ite bodily_injury (+ old 2) old))

(assert (=> offense_A2.4 (= offense_level
    (offense_A2.4_SOC_2
        (offense_A2.4_SOC_1 base_offense_level)))))

;; ========== SECTION 2A3: CRIMINAL SEXUAL ABUSE AND OFFENSES RELATED TO REGISTRATION AS A SEX OFFENDER ==========

;; §2A3.1 - Criminal Sexual Abuse; Attempt to Commit Criminal Sexual Abuse
(assert (=> offense_A3.1
    (ite law_18_USC_2241_c
         (= base_offense_level 38)
         (= base_offense_level 30))))

(define-fun offense_A3.1_SOC_1 ((old Int)) Int
    (ite (or law_18_USC_2241_a law_18_USC_2241_b) (+ old 4) old))


(define-fun offense_A3.1_SOC_2 ((old Int)) Int
    (ite (and (not law_18_USC_2241_c)
              (< victim_age 12))
         (+ old 4)
         (ite (and (not law_18_USC_2241_c)
                   (and (>= victim_age 12) (< victim_age 16)))
              (+ old 2)
              old)))

(define-fun offense_A3.1_SOC_3 ((old Int)) Int
    (ite (or victim_in_defendant_custody victim_in_correctional_custody)
         (+ old 2)
         old))


(define-fun offense_A3.1_SOC_4 ((old Int)) Int
    (ite permanent_or_life_threatening_injury (+ old 4)
        (ite between_serious_and_permanent_injury (+ old 3)
            (ite serious_bodily_injury (+ old 2)
                 old))))


(define-fun offense_A3.1_SOC_5 ((old Int)) Int
    (ite victim_abducted (+ old 4) old))

(define-fun offense_A3.1_SOC_6 ((old Int)) Int
    (ite (or misrepresentation_of_identity used_computer) (+ old 2) old))

(assert (=> offense_A3.1 (= offense_level
    (offense_A3.1_SOC_6
        (offense_A3.1_SOC_5
            (offense_A3.1_SOC_4
                (offense_A3.1_SOC_3
                    (offense_A3.1_SOC_2
                        (offense_A3.1_SOC_1 base_offense_level)))))))))

;; §2A3.2 - Criminal Sexual Abuse of a Minor Under the Age of Sixteen Years (Statutory Rape)
(assert (=> offense_A3.2 (= base_offense_level 18)))

(define-fun offense_A3.2_SOC_1 ((old Int)) Int
    (ite victim_in_defendant_custody (+ old 4) old))

(define-fun offense_A3.2_SOC_2 ((old Int)) Int
    (ite (and (not victim_in_defendant_custody)
              (or misrepresentation_of_identity
                  undue_influence))
         (+ old 4)
         old))

(define-fun offense_A3.2_SOC_3 ((old Int)) Int
    (ite used_computer (+ old 2) old))

(assert (=> offense_A3.2 (= offense_level
    (offense_A3.2_SOC_3
        (offense_A3.2_SOC_2
            (offense_A3.2_SOC_1 base_offense_level))))))

;; §2A3.3 - Criminal Sexual Abuse of a Ward or Attempt to Commit Such Acts;
;;          Criminal Sexual Abuse of an Individual in Federal Custody
(assert (=> offense_A3.3 (= base_offense_level 18)))

(define-fun offense_A3.3_SOC_1 ((old Int)) Int
    (ite misrepresentation_of_identity (+ old 2) old))

(define-fun offense_A3.3_SOC_2 ((old Int)) Int
    (ite used_computer (+ old 2) old))

(assert (=> offense_A3.3 (= offense_level
    (offense_A3.2_SOC_2
        (offense_A3.2_SOC_1 base_offense_level)))))

;; §2A3.4 - Abusive Sexual Contact or Attempt to Commit Abusive Sexual Contact
(assert (=> offense_A3.4
    (ite (or law_18_USC_2241_a law_18_USC_2241_b)
        (= base_offense_level 20)
        (ite law_18_USC_2242
            (= base_offense_level 16)
            (= base_offense_level 12)))))

(define-fun offense_A3.4_SOC_1 ((old Int)) Int
    (ite (< victim_age 12)
         (ite (< (+ old 4) 22) 22 (+ old 4))
         old))

(define-fun offense_A3.4_SOC_2 ((old Int)) Int
    (ite (and (or law_18_USC_2241_a law_18_USC_2241_b law_18_USC_2242)
              (and (>= victim_age 12) (< victim_age 16)))
         (+ old 2)
         old))

(define-fun offense_A3.4_SOC_3 ((old Int)) Int
    (ite victim_in_defendant_custody (+ old 2) old))

(define-fun offense_A3.4_SOC_4 ((old Int)) Int
    (ite misrepresentation_of_identity (+ old 2) old))

(define-fun offense_A3.4_SOC_5 ((old Int)) Int
    (ite used_computer (+ old 2) old))

(assert (=> offense_A3.4 (= offense_level
    (offense_A3.4_SOC_5
        (offense_A3.4_SOC_4
            (offense_A3.4_SOC_3
                (offense_A3.4_SOC_2
                    (offense_A3.4_SOC_1 base_offense_level))))))))

;; §2A3.5 - Failure to Register as a Sex Offender
(assert (=> offense_A3.5
    (ite tier_III (= base_offense_level 16)
         (ite tier_II (= base_offense_level 14)
              (= base_offense_level 12)))))

(define-fun offense_A3.5_SOC_1 ((old Int)) Int
    (ite committed_sex_offense_against_minor
         (+ old 8)
         (ite committed_felony_against_minor
              (+ old 6)
              (ite committed_sex_offense_nonminor
                   (+ old 6)
                   old))))

(define-fun offense_A3.5_SOC_2 ((old Int)) Int
    (ite (or voluntarily_corrected_registration
             (and attempted_to_register_prevented_by_circumstances
                  (not defendant_contributed_to_circumstances)))
         (- old 3)
         old))

(assert (=> offense_A3.5 (= offense_level
    (offense_A3.5_SOC_2
        (offense_A3.5_SOC_1 base_offense_level)))))

;; §2A3.6 - Aggravated Offenses Relating to Registration as a Sex Offender
(assert (=> offense_A3.6
    (or law_18_USC_2250_d law_18_USC_2260A)))

;; ========== SECTION 2A4: KIDNAPPING, ABDUCTION, OR UNLAWFUL RESTRAINT ==========

;; §2A4.1 - Kidnapping, Abduction, Unlawful Restraint
(assert (=> offense_A4.1 (= base_offense_level 32)))

(define-fun offense_A4.1_SOC_1 ((old Int)) Int
    (ite ransom_demand (+ old 6) old))

(define-fun offense_A4.1_SOC_2 ((old Int)) Int
    (ite permanent_or_life_threatening_injury (+ old 4)
        (ite between_serious_and_permanent_injury (+ old 3)
            (ite serious_bodily_injury (+ old 2)
                 old))))

(define-fun offense_A4.1_SOC_3 ((old Int)) Int
    (ite dangerous_weapon_used (+ old 2) old))

(define-fun offense_A4.1_SOC_4 ((old Int)) Int
    (ite (>= release_day 30) (+ old 2)
         (ite (>= release_day 7) (+ old 1)
              old)))

(define-fun offense_A4.1_SOC_5 ((old Int)) Int
    (ite victim_sexually_exploited (+ old 6) old))

(define-fun offense_A4.1_SOC_6 ((old Int)) Int
    (ite (and (< victim_age 18) victim_transferred_for_money) (+ old 3) old))

(define-fun offense_A4.1_SOC_7 ((old Int)) Int
    (ite other_offense_applies
         (let ((adjusted_other
                  (ite other_offense_accounts_for_kidnapping
                       other_offense_level
                       (ite (> (+ 4 other_offense_level) 43)
                            43
                            (+ 4 other_offense_level)))))
           (ite (> adjusted_other old)
                adjusted_other
                old))
         old))

(assert (=> offense_A4.1 (= offense_level
    (offense_A4.1_SOC_7
        (offense_A4.1_SOC_6
            (offense_A4.1_SOC_5
                (offense_A4.1_SOC_4
                    (offense_A4.1_SOC_3
                        (offense_A4.1_SOC_2
                            (offense_A4.1_SOC_1 base_offense_level))))))))))

;; §2A4.2 - Demanding or Receiving Ransom Money
(assert (=> offense_A4.2 (= base_offense_level 23)))

;; ========== SECTION 2A5: AIR PIRACY AND OFFENSES AGAINST MASS TRANSPORTATION SYSTEMS ==========

;; §2A5.1 - Aircraft Piracy or Attempted Aircraft Piracy
(assert (=> offense_A5.1 (= base_offense_level 38)))

(define-fun offense_A5.1_SOC_1 ((old Int)) Int
    (ite death (+ old 5) old))

(assert (=> offense_A5.1 (= offense_level
    (offense_A5.1_SOC_1 base_offense_level))))

;; §2A5.2 - Interference with Flight Crew Member or Mass Transportation Systems
(assert (=> offense_A5.2
    (ite intentional_endangerment (= base_offense_level 30)
         (ite reckless_endangerment (= base_offense_level 18)
              (ite assault_occurred (= base_offense_level assault_offense_level)
                   (= base_offense_level 9))))))

(define-fun offense_A5.2_SOC_1 ((old Int)) Int
    (ite (and (or intentional_endangerment reckless_endangerment)
              firearm_discharged)
         (ite (< (+ old 5) 24) 24 (+ old 5))
         (ite (and (or intentional_endangerment reckless_endangerment)
                   dangerous_weapon_used)
              (ite (< (+ old 4) 24) 24 (+ old 4))
              (ite (and (or intentional_endangerment reckless_endangerment)
                        dangerous_weapon_threatened)
                   (ite (< (+ old 3) 24) 24 (+ old 3))
                   old))))

(assert (=> offense_A5.2 (= offense_level
    (offense_A5.2_SOC_1 base_offense_level))))

;; §2A5.3 - Committing Certain Crimes Aboard Aircraft
(assert (=> offense_A5.3 (= base_offense_level underlying_offense_level)))

(assert (=> offense_A5.3 (= offense_level base_offense_level)))

;; ========== SECTION 2A6: THREATENING OR HARASSING COMMUNICATIONS, HOAXES, STALKING, AND DOMESTIC VIOLENCE ==========

;; §2A6.1 - Threatening or Harassing Communications; Hoaxes; False Liens
(assert (=> offense_A6.1
    (ite (and (or law_47_USC_223_a_1_C law_47_USC_223_a_1_D law_47_USC_223_a_1_E) (not threat_to_injure))
         (= base_offense_level 6)
         (= base_offense_level 12))))

(define-fun offense_A6.1_SOC_1 ((old Int)) Int
    (ite intent_to_carry_out_threat (+ old 6) old))

(define-fun offense_A6.1_SOC_2 ((old Int)) Int
    (ite (or (> number_of_threats 2)
             (and law_18_USC_1521 (> number_of_false_liens_encumbrances 2)))
         (+ old 2)
         old))

(define-fun offense_A6.1_SOC_3 ((old Int)) Int
    (ite violated_court_order (+ old 2) old))

(define-fun offense_A6.1_SOC_4 ((old Int)) Int
    (ite (or caused_public_disruption caused_substantial_expenditure)
         (+ old 4)
         old))

(define-fun offense_A6.1_SOC_5 ((old Int)) Int
    (ite (and law_18_USC_115 public_threat incited_violation_of_115)
         (+ old 2)
         old))

(define-fun offense_A6.1_SOC_6 ((old Int)) Int
    (ite (and (and low_deliberation (= (+ number_of_threats number_of_false_liens_encumbrances) 1))
              (not intent_to_carry_out_threat)
              (<= number_of_threats 2)
              (not violated_court_order)
              (not caused_public_disruption)
              (not caused_substantial_expenditure)
              (not law_18_USC_1521))
         (- old 4)
         old))

(assert (=> offense_A6.1 (= offense_level
    (offense_A6.1_SOC_6
        (offense_A6.1_SOC_5
            (offense_A6.1_SOC_4
                (offense_A6.1_SOC_3
                    (offense_A6.1_SOC_2
                        (offense_A6.1_SOC_1 base_offense_level)))))))))

;; §2A6.2 - Stalking or Domestic Violence
(assert (=> offense_A6.2 (= base_offense_level 18)))

(define-fun offense_A6.2_SOC_1 ((old Int)) Int
    (let ((aggravating_count
            (+
             (ite violated_court_order 1 0)
             (ite bodily_injury 1 0)
             (ite strangulation 1 0)
             (ite (or dangerous_weapon_possessed dangerous_weapon_threatened) 1 0)
             (ite stalking_pattern 1 0))))
      (ite (>= aggravating_count 2) (+ old 4)
           (ite (>= aggravating_count 1) (+ old 2)
                old))))

(assert (=> offense_A6.2 (= offense_level (offense_A6.2_SOC_1 base_offense_level))))

;; ========== TEST CASE ==========
(assert (not (or law_47_USC_223_a_1_C law_47_USC_223_a_1_D law_47_USC_223_a_1_E)))

(assert offense_A6.1)
(assert law_18_USC_115)
(assert public_threat)
(assert caused_public_disruption)

(minimize offense_level)

(check-sat)
(get-value (offense_level))
(get-value (base_offense_level))
(get-model)

