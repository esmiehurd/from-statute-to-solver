; 3B1.1
; constants
(declare-const organizer_leader Bool)
(declare-const manager_supervisor Bool)
(declare-const participants Int)
(declare-const extensive_criminal_activity Bool)
(declare-const aggravating Bool)

; relationships
(assert (= (or organizer_leader manager_supervisor) aggravating))

; calculation
(define-fun adj_B1.1_a ((old Int)) Int
    (ite (and organizer_leader (or (>= participants 5) extensive_criminal_activity)) (+ old 4) old))

(define-fun adj_B1.1_b ((old Int)) Int
    (ite (and manager_supervisor (not organizer_leader) (or (>= participants 5) extensive_criminal_activity)) (+ old 3) old))

(define-fun adj_B1.1_c ((old Int)) Int
    (ite (and aggravating (not (or (>= participants 5) extensive_criminal_activity))) (+ old 2) old))

; apply all functions
(define-fun adj_B1.1 ((old Int)) Int
    (adj_B1.1_c (adj_B1.1_b (adj_B1.1_a old))))

; 3B1.2
(declare-const mitigating Bool)
(declare-const minimal Bool)
(declare-const minor Bool)

(assert (= (or minimal minor) mitigating))
(assert (not (and minimal minor)))

(assert (not (and aggravating mitigating)))

(define-fun adj_B1.2_a ((old Int)) Int
    (ite minimal (- old 4) old))

(define-fun adj_B1.2_b((old Int)) Int
    (ite minor (- old 2) (ite (and mitigating (not (or minimal minor)) )(- old 3) old)))

; apply all functions
(define-fun adj_B1.2 ((old Int)) Int
    (adj_B1.2_b (adj_B1.2_a old)))

; 3B1.3
(declare-const position_of_trust Bool)
(declare-const special_skill Bool)
(declare-fun included_in_base_offense (Bool) Bool)

(define-fun adj_B1.3 ((old Int)) Int
    (ite (or position_of_trust special_skill)
        (ite (or (included_in_base_offense position_of_trust)
                (included_in_base_offense special_skill))
            old
            (+ old 2))
        old))

(assert (=> (and special_skill (not position_of_trust)) (not aggravating)))

; 3B1.4
(declare-const using_a_minor Bool)

(define-fun adj_B1.4 ((old Int)) Int
    (ite using_a_minor
        (ite (included_in_base_offense using_a_minor) old (+ old 2))
        old))
; 3B1.5
(declare-const drug_trafficking Bool)
(declare-const crime_of_violence Bool)
(declare-const body_armor Bool)
(declare-const defendant_body_armor Bool)

(assert (=> defendant_body_armor body_armor))

(define-fun adj_B1.5 ((old Int)) Int
    (ite (and (or drug_trafficking crime_of_violence) body_armor)
        (ite defendant_body_armor (+ old 4) (+ old 2))
        old))

; calculate
(define-fun adj_B1 ((old Int)) Int
    (adj_B1.5 (adj_B1.4 (adj_B1.3 (adj_B1.2 (adj_B1.1 old))))))

(declare-const old_offense_level Int)
(declare-const new_offense_level Int)

(assert (= new_offense_level (adj_B1 old_offense_level)))

(assert (= old_offense_level 30))
(assert aggravating)

(minimize new_offense_level)

(check-sat)
(get-model)