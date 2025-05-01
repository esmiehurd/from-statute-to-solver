; 3A1.1
(declare-const hate Bool)
(declare-const offense_H1.1_b1 Bool)
(declare-const vulnerable Bool)
(declare-const many_vulnerable Bool)

(assert (=> many_vulnerable vulnerable))

(define-fun adj_A1.1_a ((old Int)) Int
    (ite (and hate (not offense_H1.1_b1)) (+ old 3) old))

(define-fun adj_A1.1_b ((old Int)) Int
    (ite vulnerable
        (ite many_vulnerable (+ old 4) (+ old 2))
        old))

; apply both functions
(define-fun adj_A1.1 ((old Int)) Int
    (adj_A1.1_b (adj_A1.1_a old)))

; 3A1.2
(declare-const current_government Bool)
(declare-const former_government Bool)
(declare-const family_government Bool)
(declare-const motivated_government Bool)
(declare-const offense_A Bool)
(declare-const police Bool)
(declare-const prison_official Bool)

(define-fun adj_A1.2_a ((old Int)) Int
    (ite (and (or current_government former_government family_government)
            motivated_government)
        (+ old 3)
        old))

(define-fun adj_A1.2_b ((old Int)) Int
    (ite (and (and (or current_government former_government family_government) motivated_government)
            offense_A)
        (+ old 6)
        old))

(define-fun adj_A1.2_c ((old Int)) Int
    (ite (or police prison_official) (+ old 6) old))

; apply the greatest
(define-fun adj_A1.2 ((old Int)) Int
    (ite (and (> (adj_A1.2_a old) (adj_A1.2_b old)) (> (adj_A1.2_a old) (adj_A1.2_c old)))
        (adj_A1.2_a old)
        (ite (> (adj_A1.2_b old) (adj_A1.2_c old))
            (adj_A1.2_b old)
            (adj_A1.2_c old))))

; 3A1.3
(declare-const restrained Bool)

; only one possible adjustment
(define-fun adj_A1.3 ((old Int)) Int
    (ite restrained (+ old 3) old))

; 3A1.4
(declare-const terrorism Bool)

; only one possible adjustment
(define-fun adj_A1.4 ((old Int)) Int
    (ite terrorism (ite (< (+ old 12) 32) 32 (+ old 12)) old))

; 3A1.5
(declare-const human_rights Bool)
(declare-const law_USC_1091_c Bool)
(declare-const death Bool)
(assert (=> law_USC_1091_c human_rights))

(define-fun adj_A1.5_a ((old Int)) Int
    (ite law_USC_1091_c (+ old 2) old))

(define-fun adj_A1.5_b ((old Int)) Int
    (ite human_rights (ite (and (< (+ old 4) 37) death) 37 (+ old 4)) old))

; apply both functions
(define-fun adj_A1.5 ((old Int)) Int
    (adj_A1.5_b (adj_A1.5_a old)))

(define-fun adj_A1 ((old Int)) Int
    (adj_A1.5 (adj_A1.4 (adj_A1.3 (adj_A1.2 (adj_A1.1 old))))))
; calculate
(declare-const offense_level Int)
(declare-const new_offense_level Int)

(assert (= new_offense_level (adj_A1 offense_level)))

; define parameters
(assert (= offense_level 12))
(assert hate)
(assert police)
(assert law_USC_1091_c)

(check-sat)
(get-model)
