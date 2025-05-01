;; ========== BASE STRUCTURE ==========
(declare-const base_offense_level Int)
(declare-const offense_level Int)

;; ========== OFFENSE TYPES ==========
(declare-const offense_B Bool)

(declare-const offense_B1 Bool)
(declare-const offense_B1.1 Bool)
(declare-const offense_B1.4 Bool)
(declare-const offense_B1.5 Bool)
(declare-const offense_B1.6 Bool)

(declare-const offense_B2 Bool)
(declare-const offense_B2.1 Bool)
(declare-const offense_B2.3 Bool)

(declare-const offense_B3 Bool)
(declare-const offense_B3.1 Bool)
(declare-const offense_B3.2 Bool)
(declare-const offense_B3.3 Bool)

(declare-const offense_B4 Bool)
(declare-const offense_B4.1 Bool)

(declare-const offense_B5 Bool)
(declare-const offense_B5.1 Bool)
(declare-const offense_B5.3 Bool)

(declare-const offense_B6)
(declare-const offense_B6.1 Bool)

(assert (=> offense_B1 (= 1 (+
    (ite offense_B1.1 1 0)
    (ite offense_B1.4 1 0)
    (ite offense_B1.5 1 0)
    (ite offense_B1.6 1 0)))))

(assert (= offense_B2 (xor offense_B1.1 offense_B2.3)))

(assert (=> offense_B3 (= 1 (+
    (ite offense_B3.1 1 0)
    (ite offense_B3.2 1 0)
    (ite offense_B3.3 1 0)))))

(assert (= offense_B4 offense_B4.1))

(assert (= offense_B5 (xor offense_B5.1 offense_B5.3)))

(assert (= offense_B6 offense_B6.1))

;; ========== SHARED CONSTANTS ==========
(declare-const loss Int)
(declare-const statutory_maximum Int)
(declare-const victims Int)
(declare-const mass_marketing Bool)
(declare-const substantial_financial_hardship Int)
(declare-const theft Bool)
(declare-const stolen_property Bool)
(declare-const business_of_receiving_selling_stolen_property Bool)
(declare-const cemetary_memorial Bool)
(declare-const email_addresses Bool)
(declare-const law_18_USC_1037 Bool)
(declare-const healthcare_offense Bool)
(declare-const law_18_USC_670 Bool)
(declare-const employee_agent_medical_supply_chain Bool)
(declare-const misrepresentation_charity Bool)
(declare-const misrepresentation_education Bool)
(declare-const misrepresentation_religious Bool)
(declare-const misrepresentation_political Bool)
(declare-const misrepresentation_government Bool)
(declare-const misrepresentation_bankrupcy Bool)
(declare-const prior_order_violation Bool)
(declare-const misrepresentation_for_higher_education Bool)
(declare-const relocation Bool)
(declare-const outside_US Bool)
(declare-const sophisticated_means Bool)
(declare-const device_making_equipment Bool)
(declare-const access_device Bool)
(declare-const produce_identification_unlawfully Bool)
(declare-const possess_unlawful_identification Int)
(declare-const law_18_USC_1040 Bool)
(declare-const law_42_USC_408_a Bool)
(declare-const law_42_USC_1011_a Bool)
(declare-const law_42_USC_1383a_a Bool)
(declare-const trade_secret Bool)
(declare-const trade_secret_outside_US Bool)
(declare-const trade_secret_foreign_government Bool)
(declare-const stolen_vehicles Bool)
(declare-const stolen_vehicle_parts Bool)
(declare-const stolen_goods_chattels_cargo_shipment Bool)
(declare-const conscious_reckless_risk_of_death_injury Bool)
(declare-const dangerous_weapon_possessed Bool)
(declare-const receipts_financial_institutions Int)
(declare-const jeopardized_financial_institution Bool)
(declare-const endangered_organization Bool)
(declare-const publically_traded_organization Bool)
(declare-const number_of_employees Int)
(declare-const law_18_USC_1030 Bool)
(declare-const intent_to_obtain_personal_information Bool)
(declare-const unauthorized_public_dissemination_personal_information Bool)
(declare-const computer_system_infrastructure Bool)
(declare-const computer_system_government Bool)
(declare-const law_18_USC_1030_a_5_A Bool)
(declare-const disruption_of_critical_infrastructure Bool)
(declare-const securities_violation Bool)
(declare-const officer_director_publically_traded_company Bool)
(declare-const broker_dealer Bool)
(declare-const investment_advisor Bool)
(declare-const commodities_violation Bool)
(declare-const officer_director_commission_merchant_broker Bool)
(declare-const commodities_trading_advisor Bool)
(declare-const commodity_pool_operator Bool)
(declare-const gain Int)
(declare-const organized_scheme Bool)
(declare-const cultural_heritage_value Int)
(declare-const national_park Bool)
(declare-const national_historic_landmark Bool)
(declare-const national_monument Bool)
(declare-const national_marine_sanctuary Bool)
(declare-const national_cemetary_memorial Bool)
(declare-const museum Bool)
(declare-const world_heritage_list Bool)
(declare-const human_remains Bool)
(declare-const funerary_object Bool)
(declare-const cultural_patrimony Bool)
(declare-const sacred_object Bool)
(declare-const cultural_property Bool)
(declare-const archaeological_ethnological_material Bool)
(declare-const precolumbian_sculpture_mural Bool)
(declare-const commercial_purpose Bool)
(declare-const cultural_heritage_resources Bool)
(declare-const paleontological_resources Bool)
(declare-const dangerous_weapon_used Bool)
(declare-const dangerous_weapon_threatened Bool)
(declare-const statute_term Int)
(declare-const organize)

(declare-const burglary_residence Bool)
(declare-const more_than_minimal_planning Bool)
(declare-const firearm_taken Bool)
(declare-const destructive_device_taken Bool)
(declare-const controlled_substance_taken Bool)
(declare-const trespass_white_house_or_vp_residence Bool)
(declare-const trespass_secure_gov_facility Bool)
(declare-const trespass_nuclear_facility Bool)
(declare-const trespass_us_aircraft_or_vessel Bool)
(declare-const trespass_secure_airport_or_seaport Bool)
(declare-const trespass_residence Bool)
(declare-const trespass_national_cemetery Bool)
(declare-const trespass_restricted_building Bool)
(declare-const trespass_gov_or_critical_computer Bool)
(declare-const invasion_of_protected_computer Bool)

(declare-const firearm_discharged Bool)
(declare-const firearm_used Bool)
(declare-const firearm_possessed Bool)
(declare-const bodily_injury Bool)
(declare-const serious_bodily_injury Bool)
(declare-const medium_injury Bool)
(declare-const between_serious_and_permanent_injury Bool)
(declare-const permanent_or_life_threatening_injury Bool)
(declare-const victim_abducted Bool)
(declare-const victim_physically_restrained Bool)
(declare-const threat_of_death Bool)
(declare-const financial_or_post_office_property Bool)
(declare-const carjacking Bool)
(declare-const blackmail_amount Int)

(declare-const bribery_value Int)
(declare-const improper_benefit_value Int)

(declare-const counterfeit_face_value Int)
(declare-const manufactured_counterfeit Bool)
(declare-const possessed_counterfeiting_device Bool)
(declare-const possessed_counterfeiting_material Bool)
(declare-const counterfeit_paper_similar_to_distinctive Bool)
(declare-const genuine_currency_paper_modified Bool)
(declare-const counterfeit_deterrent_device Bool)
(declare-const offense_committed_outside_US Bool)
(declare-const infringement_amount Int)
(declare-const work_prepared_for_commercial_distribution Bool)
(declare-const manufacturing_infringing_item Bool)
(declare-const uploading_infringing_item Bool)
(declare-const law_17_USC_1201 Bool)
(declare-const law_17_USC_1204 Bool)
(declare-const commercial_advantage Bool)
(declare-const private_financial_gain Bool)
(declare-const counterfeit_mark_on_drug Bool)
(declare-const counterfeit_military_good_critical Bool)

(declare-const retail_value_vehicles_parts Int)

;; ========== RELATIONSHIPS ==========
(assert (=> (or trade_secret_outside_US trade_secret_foreign_government) trade_secret))
(assert (=> (or stolen_vehicles stolen_vehicle_parts stolen_goods_chattels_cargo_shipment) stolen_property))
(assert (=> law_18_USC_1030_a_5_A law_18_USC_1030))
(assert (=> (or dangerous_weapon_threatened dangerous_weapon_used) dangerous_weapon_possessed))

;; ========== SECTION 2B1: THEFT, EMBEZZLEMENT, RECEIPT OF STOLEN PROPERTY, PROPERTY DESTRUCTION, AND OFFENSES INVOLVING FRAUD OR DECEIT ==========

;; 2B1.1 - Larceny, Embezzlement, and Other Forms of Theft
(assert (=> offense_B1.1 
    (ite (>= statutory_maximum 20) (= base_offense_level 7) (= base_offense_level 6))))

(define-fun offense_B1.1_SOC_1 ((old Int)) Int
    (ite (> loss 550000000) (+ old 30)
        (ite (> loss 250000000) (+ old 28)
            (ite (> loss 150000000) (+ old 26)
                (ite (> loss 65000000) (+ old 24)
                    (ite (> loss 25000000) (+ old 22)
                        (ite (> loss 9500000) (+ old 10)
                            (ite (> loss 3500000) (+ old 18)
                                (ite (> loss 1500000) (+ old 16)
                                    (ite (> loss 550000) (+ old 14)
                                        (ite (> loss 250000) (+ old 12)
                                            (ite (> loss 150000) (+ old 10)
                                                (ite (> loss 95000) (+ old 8)
                                                    (ite (> loss 40000) (+ old 6)
                                                        (ite (> loss 15000) (+ old 4)
                                                            (ite (< loss 6500) (+ old 2)
                                                                old))))))))))))))))

(define-fun offense_B1.1_SOC_2 ((old Int)) Int
    (ite (>= substantial_financial_hardship 25)
        (+ old 6)
        (ite (>= substantial_financial_hardship 10)
            (+ old 4)
            (ite (or (> substantial_financial_hardship 1) (>= victims 10) mass_marketing)
                (+ old 2)
                old))))

(define-fun offense_B1.1_SOC_3 ((old Int)) Int
    (ite theft
        (+ old 2)
        old))

(define-fun offense_B1.1_SOC_4 ((old Int)) Int
    (ite (and stolen_property business_of_receiving_selling_stolen_property)
        (+ old 2)
        old))

(define-fun offense_B1.1_SOC_5 ((old Int)) Int
    (ite cemetary_memorial
        (+ old 2)
        old))

(define-fun offense_B1.1_SOC_6 ((old Int)) Int
    (ite (and email_addresses law_18_USC_1037)
        (+ old 2)
        old))

(define-fun offense_B1.1_SOC_7 ((old Int)) Int
    (ite healthcare_offense
        (ite (> loss 20000000) 
            (+ old 4)
            (ite (> loss 7000000)
                (+ old 3)
                (ite (> loss 1000000)
                    (+ old 2)
                    old)))
        old))

(define-fun offense_B1.1_SOC_8 ((old Int)) Int
    (ite law_18_USC_670
        (ite employee_agent_medical_supply_chain
            (+ old 4)
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_9 ((old Int)) Int
    (ite (or (or misrepresentation_charity misrepresentation_education misrepresentation_religious misrepresentation_political misrepresentation_government)
            misrepresentation_bankrupcy
            prior_order_violation)
        (ite (< (+ old 2) 10)
            10
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_10 ((old Int)) Int
    (ite (or relocation outside_US sophisticated_means)
        (ite (< (+ old 2) 12)
            12
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_11 ((old Int)) Int
    (ite (or device_making_equipment access_device (or produce_identification_unlawfully (>= possess_unlawful_identification 5)))
        (ite (< (+ old 2) 12)
            12
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_12 ((old Int)) Int
    (ite law_18_USC_1040
        (ite (< (+ old 2) 12)
            12
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_13 ((old Int)) Int
    (ite (and (or law_42_USC_408_a law_42_USC_1011_a law_42_USC_1383a_a) (>= statutory_maximum 10))
        (ite (< (+ old 4) 12)
            12
            (+ old 4))
        old))

(define-fun offense_B1.1_SOC_14 ((old Int)) Int
    (ite trade_secret
        (ite trade_secret_foreign_government
            (ite (< (+ old 4) 14)
                14
                (+ old 4))
            (ite trade_secret_outside_US
                (+ old 2)
                old))
        old))

(define-fun offense_B1.1_SOC_15 ((old Int)) Int
    (ite (and organized_scheme (or stolen_vehicles stolen_vehicle_parts stolen_goods_chattels_cargo_shipment))
        (ite (< (+ old 2) 14)
            14
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_16 ((old Int)) Int
    (ite (or conscious_reckless_risk_of_death_injury dangerous_weapon_possessed)
        (ite (< (+ old 2) 14)
            14
            (+ old 2))
        old))

(define-fun offense_B1.1_SOC_17 ((old Int)) Int
    (ite (or jeopardized_financial_institution (and endangered_organization (or publically_traded_organization (>= number_of_employees 1000))))
        (ite (>= 8 (+ (offense_B1.1_SOC_2 0) 4))
            (ite (< (+ old 4) 24)
                24
                (+ old 4))
            (+ old (- 8 (offense_B1.1_SOC_2 0))))
        (ite (> receipts_financial_institutions 1000000)
            (ite (< (+ old 2) 24)
                24
                (+ old 2))
            old)))

(define-fun offense_B1.1_SOC_18 ((old Int)) Int
    (ite (and law_18_USC_1030 (or intent_to_obtain_personal_information unauthorized_public_dissemination_personal_information))
        (+ old 2)
        old))

(define-fun offense_B1.1_SOC_19 ((old Int)) Int
    (ite (and law_18_USC_1030 disruption_of_critical_infrastructure)
        (ite (< (+ old 6) 24)
            24
            (+ old 6))
        (ite law_18_USC_1030_a_5_A
            (+ old 4)
            (ite (and law_18_USC_1030 (or computer_system_infrastructure computer_system_government))
                (+ old 2)
                old))))

(define-fun offense_B1.1_SOC_20 ((old Int)) Int
    (ite (or (and securities_violation
                (or officer_director_publically_traded_company broker_dealer investment_advisor))
            (and commodities_violation
                (or officer_director_commission_merchant_broker commodities_trading_advisor commodity_pool_operator)))
        (+ old 4)
        old))

(assert (=> offense_B1.1 (= offense_level
    (offense_B1.1_SOC_20
        (offense_B1.1_SOC_19 
            (offense_B1.1_SOC_18
                (offense_B1.1_SOC_17
                    (offense_B1.1_SOC_16
                        (offense_B1.1_SOC_15
                            (offense_B1.1_SOC_14
                                (offense_B1.1_SOC_13
                                    (offense_B1.1_SOC_12
                                        (offense_B1.1_SOC_11
                                            (offense_B1.1_SOC_10
                                                (offense_B1.1_SOC_9
                                                    (offense_B1.1_SOC_8
                                                        (offense_B1.1_SOC_7
                                                            (offense_B1.1_SOC_6
                                                                (offense_B1.1_SOC_5
                                                                    (offense_B1.1_SOC_4
                                                                        (offense_B1.1_SOC_3
                                                                            (offense_B1.1_SOC_2
                                                                                (offense_B1.1_SOC_1 base_offense_level)))))))))))))))))))))))

;; 2B1.4 - Insider Trading
(assert (=> offense_B1.4 (= base_offense_level 8)))

(define-fun offense_B1.4_SOC_1 ((old Int)) Int
    (ite (> gain 550000000) (+ old 30)
        (ite (> gain 250000000) (+ old 28)
            (ite (> gain 150000000) (+ old 26)
                (ite (> gain 65000000) (+ old 24)
                    (ite (> gain 25000000) (+ old 22)
                        (ite (> gain 9500000) (+ old 10)
                            (ite (> gain 3500000) (+ old 18)
                                (ite (> gain 1500000) (+ old 16)
                                    (ite (> gain 550000) (+ old 14)
                                        (ite (> gain 250000) (+ old 12)
                                            (ite (> gain 150000) (+ old 10)
                                                (ite (> gain 95000) (+ old 8)
                                                    (ite (> gain 40000) (+ old 6)
                                                        (ite (> gain 15000) (+ old 4)
                                                            (ite (< gain 6500) (+ old 2)
                                                                old))))))))))))))))

(define-fun offense_B1.4_SOC_2 ((old Int)) Int
    (ite (and organized_scheme (< (offense_B1.4_SOC_1 8) 14)) 14 old))

(assert (=> offense_B1.4 (= offense_level
    (offense_B1.4_SOC_2
        (offense_B1.4_SOC_1 base_offense_level)))))

; 2B1.5 - Theft of, Damage to, or Destruction of, Cultural Heritage Resources
(assert (=> offense_B1.5 (= base_offense_level 8)))

(define-fun offense_B1.5_SOC_1 ((old Int)) Int
    (ite (> cultural_heritage_value 550000000) (+ old 30)
            (ite (> cultural_heritage_value 250000000) (+ old 28)
                (ite (> cultural_heritage_value 150000000) (+ old 26)
                    (ite (> cultural_heritage_value 65000000) (+ old 24)
                        (ite (> cultural_heritage_value 25000000) (+ old 22)
                            (ite (> cultural_heritage_value 9500000) (+ old 10)
                                (ite (> cultural_heritage_value 3500000) (+ old 18)
                                    (ite (> cultural_heritage_value 1500000) (+ old 16)
                                        (ite (> cultural_heritage_value 550000) (+ old 14)
                                            (ite (> cultural_heritage_value 250000) (+ old 12)
                                                (ite (> cultural_heritage_value 150000) (+ old 10)
                                                    (ite (> cultural_heritage_value 95000) (+ old 8)
                                                        (ite (> cultural_heritage_value 40000) (+ old 6)
                                                            (ite (> cultural_heritage_value 15000) (+ old 4)
                                                                (ite (< cultural_heritage_value 6500) (+ old 2)
                                                                    (ite (< cultural_heritage_value 2500) (+ old 1)
                                                                        old)))))))))))))))))

(define-fun offense_B1.5_SOC_2 ((old Int)) Int
    (ite (or national_park national_historic_landmark national_monument national_cemetary_memorial museum world_heritage_list)
        (+ old 2)
        old))

(define-fun offense_B1.5_SOC_3 ((old Int)) Int
    (ite (or human_remains funerary_object cultural_patrimony sacred_object cultural_property archaeological_ethnological_material precolumbian_sculpture_mural)
        (+ old 2)
        old))

(define-fun offense_B1.5_SOC_4 ((old Int)) Int
    (ite commercial_purpose
        (+ old 2)
        old))

(define-fun offense_B1.5_SOC_5 ((old Int)) Int
    (ite (or cultural_heritage_resources paleontological_resources)
        (+ old 2)
        old))

(define-fun offense_B1.5_SOC_6 ((old Int)) Int
    (ite (or dangerous_weapon_used dangerous_weapon_threatened)
        (ite (< (+ old 2) 14)
            14
            (+ old 2))
        old))

(assert (=> offense_B1.5 (= offense_level
    (offense_B1.5_SOC_6
        (offense_B1.5_SOC_5
            (offense_B1.5_SOC_4
                (offense_B1.5_SOC_3
                    (offense_B1.5_SOC_2
                        (offense_B1.5_SOC_1 base_offense_level)))))))))

; 2B1.6 - Aggravated Identity Theft
(assert (=> offense_B1.6 (= base_offense_level statute_term)))
(assert (=> offense_B1.6 (= offense_level base_offense_level)))

;; ========== SECTION 2B2: BURGLARY AND TRESPASS ==========

;; 2B2.1 - Burglary
(assert (=> offense_B2.1
    (ite burglary_residence
         (= base_offense_level 17)
         (= base_offense_level 12))))

(define-fun offense_B2.1_SOC_1 ((old Int)) Int
    (ite more_than_minimal_planning (+ old 2) old))

(define-fun offense_B2.1_SOC_2 ((old Int)) Int
    (ite (> loss 9500000) (+ old 8)
        (ite (> loss 5000000) (+ old 7)
            (ite (> loss 3000000) (+ old 6)
                (ite (> loss 1500000) (+ old 5)
                    (ite (> loss 500000) (+ old 4)
                        (ite (> loss 95000) (+ old 3)
                            (ite (> loss 20000) (+ old 2)
                                (ite (> loss 5000) (+ old 1)
                                     old)))))))))

(define-fun offense_B2.1_SOC_3 ((old Int)) Int
    (ite (or firearm_taken destructive_device_taken controlled_substance_taken)
        (+ old 1)
        old))

(define-fun offense_B2.1_SOC_4 ((old Int)) Int
    (ite dangerous_weapon_possessed (+ old 2) old))

(assert (=> offense_B2.1 (= offense_level
    (offense_B2.1_SOC_4
        (offense_B2.1_SOC_3
            (offense_B2.1_SOC_2
                (offense_B2.1_SOC_1 base_offense_level)))))))

;; 2B2.3 - Trespass
(assert (=> offense_B2.3 (= base_offense_level 4)))

(define-fun offense_B2.3_SOC_1 ((old Int)) Int
    (ite trespass_white_house_or_vp_residence
         (+ old 4)
         (ite (or trespass_secure_gov_facility
                  trespass_nuclear_facility
                  trespass_us_aircraft_or_vessel
                  trespass_secure_airport_or_seaport
                  trespass_residence
                  trespass_national_cemetery
                  trespass_restricted_building
                  trespass_gov_or_critical_computer)
              (+ old 2)
              old)))

(define-fun offense_B2.3_SOC_2 ((old Int)) Int
    (ite dangerous_weapon_possessed (+ old 2) old))

(define-fun offense_B2.3_SOC_3 ((old Int)) Int
    (ite (and invasion_of_protected_computer (> loss 2500))
         (ite (> loss 6500)
              (offense_B1.1_SOC_1 old)
              (+ old 1))
         old))

(assert (=> offense_B2.3 (= offense_level
    (offense_B2.3_SOC_3
        (offense_B2.3_SOC_2
            (offense_B2.3_SOC_1 base_offense_level))))))

;; ========== SECTION 2B3: ROBBERY, EXTORTION, AND BLACKMAIL ==========

;; 2B3.1 - Robbery
(assert (=> offense_B3.1 (= base_offense_level 20)))

(define-fun offense_B3.1_SOC_1 ((old Int)) Int
    (ite financial_or_post_office_property (+ old 2) old))

(define-fun offense_B3.1_SOC_2 ((old Int)) Int
    (let ((weapon_adj
            (ite firearm_discharged (+ old 7)
                (ite firearm_used (+ old 6)
                    (ite firearm_possessed (+ old 5)
                        (ite dangerous_weapon_used (+ old 4)
                            (ite dangerous_weapon_possessed (+ old 3)
                                (ite threat_of_death (+ old 2) old))))))))
      (ite (> weapon_adj (- old 11)) (+ old (- 11 old)) weapon_adj)))

(define-fun offense_B3.1_SOC_3 ((old Int)) Int
    (let ((injury_adj
            (ite permanent_or_life_threatening_injury (+ old 6)
                (ite between_serious_and_permanent_injury (+ old 5)
                    (ite serious_bodily_injury (+ old 4)
                        (ite medium_injury (+ old 3)
                            (ite bodily_injury (+ old 2) old)))))))
      (ite (> (- injury_adj old) (- 11 (- injury_adj old)))
           (+ old (- 11 (- injury_adj old)))
           injury_adj)))

(define-fun offense_B3.1_SOC_2_3_combined ((old Int)) Int
    (let ((weapon_injury_combined
            (+ (- (offense_B3.1_SOC_2 old) old)
               (- (offense_B3.1_SOC_3 old) old))))
      (ite (> weapon_injury_combined 11)
           (+ old 11)
           (+ old weapon_injury_combined))))

(define-fun offense_B3.1_SOC_4 ((old Int)) Int
    (ite victim_abducted (+ old 4)
        (ite victim_physically_restrained (+ old 2) old)))

(define-fun offense_B3.1_SOC_5 ((old Int)) Int
    (ite carjacking (+ old 2) old))

(define-fun offense_B3.1_SOC_6 ((old Int)) Int
    (ite (or firearm_taken destructive_device_taken controlled_substance_taken)
         (+ old 1)
         old))

(define-fun offense_B3.1_SOC_7 ((old Int)) Int
    (ite (> loss 9500000) (+ old 7)
        (ite (> loss 5000000) (+ old 6)
            (ite (> loss 3000000) (+ old 5)
                (ite (> loss 1500000) (+ old 4)
                    (ite (> loss 500000) (+ old 3)
                        (ite (> loss 95000) (+ old 2)
                            (ite (> loss 20000) (+ old 1) old))))))))

(assert (=> offense_B3.1 (= offense_level
    (offense_B3.1_SOC_7
        (offense_B3.1_SOC_6
            (offense_B3.1_SOC_5
                (offense_B3.1_SOC_4
                    (offense_B3.1_SOC_2_3_combined
                        (offense_B3.1_SOC_1 base_offense_level)))))))))

;; §2B3.2 - Extortion by Force or Threat of Injury or Serious Damage
(assert (=> offense_B3.2 (= base_offense_level 18)))

(define-fun offense_B3.2_SOC_1 ((old Int)) Int
    (ite threat_of_death (+ old 2) old))

(define-fun offense_B3.2_SOC_2 ((old Int)) Int
    (ite (> loss 9500000) (+ old 7)
        (ite (> loss 5000000) (+ old 6)
            (ite (> loss 3000000) (+ old 5)
                (ite (> loss 1500000) (+ old 4)
                    (ite (> loss 500000) (+ old 3)
                        (ite (> loss 95000) (+ old 2)
                            (ite (> loss 20000) (+ old 1)
                                old))))))))

(define-fun offense_B3.2_SOC_3 ((old Int)) Int
    (let ((weapon_or_threat_adj
            (ite firearm_discharged (+ old 7)
                (ite firearm_used (+ old 6)
                    (ite firearm_possessed (+ old 5)
                        (ite dangerous_weapon_used (+ old 4)
                            (ite dangerous_weapon_possessed (+ old 3)
                                (ite (or threat_of_death victim_abducted victim_physically_restrained) (+ old 3)
                                     old))))))))
      weapon_or_threat_adj))

(define-fun offense_B3.2_SOC_4 ((old Int)) Int
    (let ((injury_adj
            (ite permanent_or_life_threatening_injury (+ old 6)
                (ite between_serious_and_permanent_injury (+ old 5)
                    (ite serious_bodily_injury (+ old 4)
                        (ite medium_injury (+ old 3)
                            (ite bodily_injury (+ old 2) old)))))))
      injury_adj))

(define-fun offense_B3.2_SOC_3_4_combined ((old Int)) Int
    (let ((weapon_injury_combined
            (+ (- (offense_B3.2_SOC_3 old) old)
               (- (offense_B3.2_SOC_4 old) old))))
      (ite (> weapon_injury_combined 11)
           (+ old 11)
           (+ old weapon_injury_combined))))

(define-fun offense_B3.2_SOC_5 ((old Int)) Int
    (ite victim_abducted (+ old 4)
        (ite victim_physically_restrained (+ old 2) old)))

(assert (=> offense_B3.2 (= offense_level
    (offense_B3.2_SOC_5
        (offense_B3.2_SOC_3_4_combined
            (offense_B3.2_SOC_2
                (offense_B3.2_SOC_1 base_offense_level)))))))

;; 2B3.3 – Blackmail and Similar Forms of Extortion
(assert (=> offense_B3.3 (= base_offense_level 9)))

(define-fun offense_B3.3_SOC_1 ((old Int)) Int
    (ite (> blackmail_amount 550000000) (+ old 30)
        (ite (> blackmail_amount 250000000) (+ old 28)
            (ite (> blackmail_amount 150000000) (+ old 26)
                (ite (> blackmail_amount 65000000) (+ old 24)
                    (ite (> blackmail_amount 25000000) (+ old 22)
                        (ite (> blackmail_amount 9500000) (+ old 10)
                            (ite (> blackmail_amount 3500000) (+ old 18)
                                (ite (> blackmail_amount 1500000) (+ old 16)
                                    (ite (> blackmail_amount 550000) (+ old 14)
                                        (ite (> blackmail_amount 250000) (+ old 12)
                                            (ite (> blackmail_amount 150000) (+ old 10)
                                                (ite (> blackmail_amount 95000) (+ old 8)
                                                    (ite (> blackmail_amount 40000) (+ old 6)
                                                        (ite (> blackmail_amount 15000) (+ old 4)
                                                            (ite (> blackmail_amount 6500) (+ old 2)
                                                                (ite (> blackmail_amount 2500 (+ old 1)                                                           
                                                                    old))))))))))))))))))

(assert (=> offense_B3.3 (= offense_level
    (offense_B3.3_SOC_1 base_offense_level))))

;; ========== SECTION 2B4: COMMERCIAL BRIBERY AND KICKBACKS ==========
;; §2B4.1 - Bribery in Procurement of Bank Loan and Other Commercial Bribery
(assert (=> offense_B4.1 (= base_offense_level 8)))

(define-fun offense_B4.1_SOC_1 ((old Int)) Int
    (let ((amount (ite (> bribery_value improper_benefit_value) bribery_value improper_benefit_value)))
        (ite (> amount 550000000) (+ old 30)
            (ite (> amount 250000000) (+ old 28)
                (ite (> amount 150000000) (+ old 26)
                    (ite (> amount 65000000) (+ old 24)
                        (ite (> amount 25000000) (+ old 22)
                            (ite (> amount 9500000) (+ old 10)
                                (ite (> amount 3500000) (+ old 18)
                                    (ite (> amount 1500000) (+ old 16)
                                        (ite (> amount 550000) (+ old 14)
                                            (ite (> amount 250000) (+ old 12)
                                                (ite (> amount 150000) (+ old 10)
                                                    (ite (> amount 95000) (+ old 8)
                                                        (ite (> amount 40000) (+ old 6)
                                                            (ite (> amount 15000) (+ old 4)
                                                                (ite (> amount 6500) (+ old 2)
                                                                    (ite (> amount 2500 (+ old 1)                                                           
                                                                        old)))))))))))))))))))

(define-fun offense_B4.1_SOC_2 ((old Int)) Int
    (ite jeopardized_financial_institution
        (ite (< (+ old 4) 24) 24 (+ old 4))
        (ite (> receipts_financial_institutions 1000000)
            (ite (< (+ old 2) 24) 24 (+ old 2))
            old)))

(assert (=> offense_B4.1 (= offense_level
    (offense_B4.1_SOC_2
        (offense_B4.1_SOC_1 base_offense_level)))))

;; ========== SECTION 2B5: COUNTERFEITING AND INFRINGEMENT OF COPYRIGHT OR TRADEMARK ==========
;; 2B5.1 - Counterfeit Bearer Obligations
(assert (=> offense_B5.1 (= base_offense_level 9)))

(define-fun offense_B5.1_SOC_1 ((old Int)) Int
    (ite (> counterfeit_face_value 550000000) (+ old 30)
        (ite (> counterfeit_face_value 250000000) (+ old 28)
            (ite (> counterfeit_face_value 150000000) (+ old 26)
                (ite (> counterfeit_face_value 65000000) (+ old 24)
                    (ite (> counterfeit_face_value 25000000) (+ old 22)
                        (ite (> counterfeit_face_value 9500000) (+ old 10)
                            (ite (> counterfeit_face_value 3500000) (+ old 18)
                                (ite (> counterfeit_face_value 1500000) (+ old 16)
                                    (ite (> counterfeit_face_value 550000) (+ old 14)
                                        (ite (> counterfeit_face_value 250000) (+ old 12)
                                            (ite (> counterfeit_face_value 150000) (+ old 10)
                                                (ite (> counterfeit_face_value 95000) (+ old 8)
                                                    (ite (> counterfeit_face_value 40000) (+ old 6)
                                                        (ite (> counterfeit_face_value 15000) (+ old 4)
                                                            (ite (> counterfeit_face_value 6500) (+ old 2)
                                                                (ite (> counterfeit_face_value 2500 (+ old 1)                                                           
                                                                    old))))))))))))))))))

(define-fun offense_B5.1_SOC_2 ((old Int)) Int
    (ite (or manufactured_counterfeit
             possessed_counterfeiting_device
             possessed_counterfeiting_material
             counterfeit_paper_similar_to_distinctive
             genuine_currency_paper_modified
             counterfeit_deterrent_device)
         (+ old 2)
         old))

(define-fun offense_B5.1_SOC_3 ((old Int)) Int
    (ite (and (or manufactured_counterfeit
                  possessed_counterfeiting_device
                  possessed_counterfeiting_material)
              (< old 15))
         15
         old))

(define-fun offense_B5.1_SOC_4 ((old Int)) Int
    (ite dangerous_weapon_possessed
         (ite (< (+ old 2) 13) 13 (+ old 2))
         old))

(define-fun offense_B5.1_SOC_5 ((old Int)) Int
    (ite offense_committed_outside_US (+ old 2) old))

(assert (=> offense_B5.1 (= offense_level
    (offense_B5.1_SOC_5
        (offense_B5.1_SOC_4
            (offense_B5.1_SOC_3
                (offense_B5.1_SOC_2
                    (offense_B5.1_SOC_1 base_offense_level))))))))

;; 2B5.3 - Criminal Infringement of Copyright or Trademark
(assert (=> offense_B5_3 (= base_offense_level 8)))

(define-fun offense_B5.3_SOC_1 ((old Int)) Int
    (ite (> infringement_amount 550000000) (+ old 30)
        (ite (> infringement_amount 250000000) (+ old 28)
            (ite (> infringement_amount 150000000) (+ old 26)
                (ite (> infringement_amount 65000000) (+ old 24)
                    (ite (> infringement_amount 25000000) (+ old 22)
                        (ite (> infringement_amount 9500000) (+ old 10)
                            (ite (> infringement_amount 3500000) (+ old 18)
                                (ite (> infringement_amount 1500000) (+ old 16)
                                    (ite (> infringement_amount 550000) (+ old 14)
                                        (ite (> infringement_amount 250000) (+ old 12)
                                            (ite (> infringement_amount 150000) (+ old 10)
                                                (ite (> infringement_amount 95000) (+ old 8)
                                                    (ite (> infringement_amount 40000) (+ old 6)
                                                        (ite (> infringement_amount 15000) (+ old 4)
                                                            (ite (> infringement_amount 6500) (+ old 2)
                                                                (ite (> infringement_amount 2500 (+ old 1)                                                           
                                                                    old))))))))))))))))))

(define-fun offense_B5.3_SOC_2 ((old Int)) Int
    (ite work_prepared_for_commercial_distribution (+ old 2) old))

(define-fun offense_B5.3_SOC_3 ((old Int)) Int
    (ite (or manufacturing_infringing_item (and law_17_USC_1201 law_17_USC_1204))
        (ite (< (+ old 2) 12) 12 (+ old 2))
        old))

(define-fun offense_B5.3_SOC_4 ((old Int)) Int
    (ite (not (commercial_advantage private_financial_gain))
        (ite (< (- old 2) 8) 8 (- old 2))
        old))

(define-fun offense_B5.3_SOC_5 ((old Int)) Int
    (ite counterfeit_mark_on_drug (+ old 2) old))

(define-fun offense_B5.3_SOC_6 ((old Int)) Int
    (ite (or conscious_reckless_risk_of_death_injury dangerous_weapon_possessed)
        (ite (< (+ old 2) 14) 14 (+ old 2))
        old))

(define-fun offense_B5.3_SOC_7 ((old Int)) Int
    (ite counterfeit_military_good_critical
        (ite (< (+ old 2) 14) 14 (+ old 2))
        old))

(assert (=> offense_B5.3 (= offense_level
    (offense_B5.3_SOC_7
        (offense_B5.3_SOC_6
            (offense_B5.3_SOC_5
                (offense_B5.3_SOC_4
                    (offense_B5.3_SOC_3
                        (offense_B5.3_SOC_2
                            (offense_B5.3_SOC_1 base_offense_level))))))))))

;; ========== SECTION 2B6: MOTOR VEHICLE IDENTIFICATION NUMBERS ==========
;; 2B6.1 - Altering or Removing Motor Vehicle Identification Numbers
(assert (=> offense_B6.1 (= base_offense_level 8)))

(define-fun offense_B6.1_SOC_1 ((old Int)) Int
    (ite (> retail_value_vehicles_parts 550000000) (+ old 30)
            (ite (> retail_value_vehicles_parts 250000000) (+ old 28)
                (ite (> retail_value_vehicles_parts 150000000) (+ old 26)
                    (ite (> retail_value_vehicles_parts 65000000) (+ old 24)
                        (ite (> retail_value_vehicles_parts 25000000) (+ old 22)
                            (ite (> retail_value_vehicles_parts 9500000) (+ old 10)
                                (ite (> retail_value_vehicles_parts 3500000) (+ old 18)
                                    (ite (> retail_value_vehicles_parts 1500000) (+ old 16)
                                        (ite (> retail_value_vehicles_parts 550000) (+ old 14)
                                            (ite (> retail_value_vehicles_parts 250000) (+ old 12)
                                                (ite (> retail_value_vehicles_parts 150000) (+ old 10)
                                                    (ite (> retail_value_vehicles_parts 95000) (+ old 8)
                                                        (ite (> retail_value_vehicles_parts 40000) (+ old 6)
                                                            (ite (> retail_value_vehicles_parts 15000) (+ old 4)
                                                                (ite (< retail_value_vehicles_parts 6500) (+ old 2)
                                                                    (ite (< retail_value_vehicles_parts 2500) (+ old 1)
                                                                        old)))))))))))))))))

(define-fun offense_B6.1_SOC_2 ((old Int)) Int
    (ite business_of_receiving_selling_stolen_property (+ old 2) old))

(define-fun offense_B6.1_SOC_3 ((old Int)) Int
    (ite (and organized_scheme (< old 14)) 14 old))

(assert (=> offense_B6.1 (= offense_level
    (offense_B6.1_SOC_3
        (offense_B6.1_SOC_2
            (offense_B6.1_SOC_1 base_offense_level))))))

(check-sat)