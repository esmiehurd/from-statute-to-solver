(declare-const criminal_history_points Int)
(declare-const criminal_history_category Int)
(declare-const offense_level Int)
(declare-const statutory_maximum Int)
(declare-const life_sentence Bool)

; 4A1.1
(declare-const sentences_1y_1m Int)

(declare-fun crim_A1.1_a ((old Int) (sentences Int)) Int
    (+ old (* sentences 3)))

(declare-const sentences_60d Int)

(declare-fun crim_A1.1_b ((old Int) (sentences Int))
    (+ old (* sentences 2)))

(declare-const sentences_other Int)

(declare-fun crim_A1.1_c ((old Int) (sentences Int))
    (ite (> (+ old sentences) 4) (+ old 4) (+ old sentences)))

(declare-const sentences_violence_other Int)

(declare-fun crim_A1.1_d ((old Int) (sentences Int))
    (ite (> (+ old sentences) 3) (+ old 3) (+ old sentences)))

(declare-const offense_while_sentenced Bool)

(declare-fun crim_A1.1_e ((old Int))
    (ite (and (>= old 7) offense_while_sentenced) (+ old 1) old))

(declare-fun crim_A1.1 ((old Int))
    (crim_A1.1_e (crim_A1.1_d (crim_A1.1_c (crim_A1.1_b (crim_A1.1_a old sentences_1y_1m) sentences_60d) sentences_other) sentences_violence_other)))

; 4B1.1
(declare-const age_during_instant_offense Int)
(declare-const felony_instant_offesnse Bool)
(declare-const violence_instant_offense Bool)
(declare-const controlled_substance_instant_offense Bool)
(declare-const prior_felonies_violence_substance Int)

(declare-const career_offender Bool)

(assert (=>
    (and
        (>= age_during_instant_offense 18)
        felony_instant_offesnse
        (or violence_instant_offense controlled_substance_instant_offense)
        (>= prior_felonies_violence_substance 2))
    career_offender))

(declare-fun crim_B1.1_b ((old Int)) Int
    (=> criminal_offender (and
        (= criminal_history_category 4)
        (=> (and life_sentence (< old 37)) 37)
        (=> (and (>= statutory_maximum 25) (< old 34)) 34)
        (=> (and (and (>= statutory_maximum 20) (< statutory_maximum 25)) (< old 32)) 32)
        (=> (and (and (>= statutory_maximum 15) (< statutory_maximum 20)) (< old 29)) 29)
        (=> (and (and (>= statutory_maximum 10) (< statutory_maximum 15)) (< old 24)) 24)
        (=> (and (and (>= statutory_maximum 5) (< statutory_maximum 10)) (< old 17)) 17)
        (=> (and (and (>= statutory_maximum 1) (< statutory_maximum 5)) (< old 12)) 12))
    )
)

(check-sat)