; 3C1.1
(declare-const obstruction Bool)
(declare-const obstructed_defendant_offense Bool)
(declare-const obstructed_related_offense Bool)

(assert (=> (or obstructed_defendant_offense obstructed_related_offense) obstruction))

(declare-fun adj_C1.1 ((old Int)) Int
    (ite (and obstruction (or obstructed_defendant_offense obstructed_related_offense))
        (+ old 2)
        old))

; 3C1.2
(declare-const reckless_endangerment_during_fight Bool)

(declare-fun adj_C1.2 ((old Int)) Int
    (ite reckless_endangerment_during_fight (+ old 2) old))

; 3C1.3
(declare-const statutory_enhancement Bool)
; 18 U.S.C. § 3147
(declare-const offense_under_release Bool)

(assert (=> offense_under_release statutory_enhancement))

(declare-fun three_C1.3 ((old Int)) Int
    (ite offense_under_release (+ old 2) old))

; 3C1.4
; 18 U.S.C. § 3559(g)(1) 
(declare-const false_registration_of_domain_name Bool)

(assert (=> false_registration_of_domain_name statutory_enhancement))

(declare-fun three_C1.4 ((old Int)) Int
    (ite false_registration_of_domain_name (+ old 2) old))

; calculate
(define-fun adj_C1 ((old Int)) Int
    (adj_C1.4 (adj_C1.3 (adj_C1.2 (adj_C1.1 old)))))

(declare-const base_offense_level Int)
(declare-const new_offense_level Int)

(assert (= new_offense_level (adj_B1 base_offense_level)))

(check-sat)