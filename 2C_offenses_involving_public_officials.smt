(declare-const base_offense_level Int)
(declare-const offense_level Int)

(declare-const offense_C Bool)
(declare-const offense_C1 Bool)
(declare-const offense_C1.1 Bool)
(declare-const offense_C1.2 Bool)
(declare-const offense_C1.3 Bool)
(declare-const offense_C1.5 Bool)
(declare-const offense_C1.8 Bool)

(assert (offense_C offense_C1))
(assert (=> offense_C1 (or offense_C1.1 offense_C1.2 offense_C1.3 offense_C1.5 offense_C1.8)))
(assert (=> (or offense_C1.1 offense_C1.2 offense_C1.3 offense_C1.5 offense_C1.8) offense_C1))

; 2C1.1
; constants
(declare-const public_official Bool)

(declare-const bribes_extortions Int)

(declare-const bribe_value Int)

(declare-const involved_elected_public_official Bool)
(declare-const involved_high_level_public_official Bool)

(declare-const facilitated_US_entry Bool)
(declare-const obtainted_immigration_document Bool)
(declare-const obtainted_government_ID_document Bool)

; base offense level
(assert (=> offense_C1.1
    (ite public_official
        (= base_offense_level 14)
        (= base_offense_level 12))))

; specific offense characteristics
(define-fun offense_C1.1_SOC_1 ((old Int)) Int
    (ite (> bribes_extortions 1)
        (+ old 2)
        old))

(define-fun offense_C1.1_SOC_2 ((old Int)) Int
    (ite (> bribe_value 550000000) (+ old 30)
        (ite (> bribe_value 250000000) (+ old 28)
            (ite (> bribe_value 150000000) (+ old 26)
                (ite (> bribe_value 65000000) (+ old 24)
                    (ite (> bribe_value 25000000) (+ old 22)
                        (ite (> bribe_value 9500000) (+ old 10)
                            (ite (> bribe_value 3500000) (+ old 18)
                                (ite (> bribe_value 1500000) (+ old 16)
                                    (ite (> bribe_value 550000) (+ old 14)
                                        (ite (> bribe_value 250000) (+ old 12)
                                            (ite (> bribe_value 150000) (+ old 10)
                                                (ite (> bribe_value 95000) (+ old 8)
                                                    (ite (> bribe_value 40000) (+ old 6)
                                                        (ite (> bribe_value 15000) (+ old 4)
                                                            (ite (< bribe_value 6500) (+ old 2)
                                                                old))))))))))))))))

(define-fun offense_C1.1_SOC_3 ((old Int)) Int
    (ite (or involved_elected_public_official involved_high_level_public_official)
        (ite (< (+ old 4) 18)
            18
            (+ old 4))
        old))

(define-fun offense_C1.1_SOC_4 ((old Int)) Int
    (ite (and public_official (or facilitated_US_entry obtainted_immigration_document obtainted_government_ID_document))
        (+ old 2)
        old))

; applly specific offense characteristics
(assert (=> offense_C1.1 (= offense_level
    (offense_C1.1_SOC_4
        (offense_C1.1_SOC_3
            (offense_C1.1_SOC_2
                (offense_C1.1_SOC_1 base_offense_level)))))))

; 2C1.2
; constants
(declare-const gratuities Int)

(declare-const gratuity_value Int)

; base offense level
(assert (=> offense_C1.2
    (ite public_official
        (= base_offense_level 11)
        (= base_offense_level 9))))

; specific offense characteristics
(define-fun offense_C1.2_SOC_1 ((old Int)) Int
    (ite (> gratuities 1)
        (+ old 2)
        old))

(define-fun offense_C1.2_SOC_2 ((old Int)) Int
    (ite (> gratuity_value 550000000) (+ old 30)
        (ite (> gratuity_value 250000000) (+ old 28)
            (ite (> gratuity_value 150000000) (+ old 26)
                (ite (> gratuity_value 65000000) (+ old 24)
                    (ite (> gratuity_value 25000000) (+ old 22)
                        (ite (> gratuity_value 9500000) (+ old 10)
                            (ite (> gratuity_value 3500000) (+ old 18)
                                (ite (> gratuity_value 1500000) (+ old 16)
                                    (ite (> gratuity_value 550000) (+ old 14)
                                        (ite (> gratuity_value 250000) (+ old 12)
                                            (ite (> gratuity_value 150000) (+ old 10)
                                                (ite (> gratuity_value 95000) (+ old 8)
                                                    (ite (> gratuity_value 40000) (+ old 6)
                                                        (ite (> gratuity_value 15000) (+ old 4)
                                                            (ite (< gratuity_value 6500) (+ old 2)
                                                                old))))))))))))))))

(define-fun offense_C1.2_SOC_3 ((old Int)) Int
    (ite (or involved_elected_public_official involved_high_level_public_official)
        (ite (< (+ old 4) 15)
            15
            (+ old 4))
        old))   

(define-fun offense_C1.2_SOC_4 ((old Int)) Int
    (ite (and public_official (or facilitated_US_entry obtainted_immigration_document obtainted_government_ID_document))
        (+ old 2)
        old))   

; apply specific offense characteristics
(assert (=> offense_C1.2 (= offense_level
    (offense_C1.2_SOC_4
        (offense_C1.2_SOC_3
            (offense_C1.2_SOC_2
                (offense_C2.1_SOC_1 base_offense_level)))))))

; 2C1.3
; constants
(declare-const actual_planned_government_harm Bool)  

; base offense level
(assert (=> offense_C1.3 (= base_offense_level 6)))

; specific offense characteristics
(define-fun offense_C1.3_SOC_1 ((old Int)) Int
    (ite actual_planned_government_harm
        (+ old 4)
        old))

; apply specific offense characteristics
(assert (=> offense_C1.3 (= offense_level
    (offense_C1.3_SOC_1 base_offense_level))))

; 2C1.5\
; base offense level
(assert (=> offense_C1.4 (= base_offense_level 8)))

; no specific offense characteristics
(assert (=> offense_C1.4 (= offense_level base_offense_level)))

; 2C1.8
; constants
(declare-const illegal_transaction_value Int)

(declare-const foreign_national Bool)
(declare-const foreign_government Bool)

(declare-const government_funds Bool)
(declare-const non_monetary_benefit Bool)

(declare-const illegal_transactions Int)

(declare-const intimidation_harm_coercion Bol)

; base offense level
(assert (=> offense_C1.8 (= base_offense_level 8)))

; specific offense characteristics
(define-fun offense_C1.8_SOC_1 ((old Int)) Int
    (ite (> illegal_transaction_value 550000000) (+ old 30)
        (ite (> illegal_transaction_value 250000000) (+ old 28)
            (ite (> illegal_transaction_value 150000000) (+ old 26)
                (ite (> illegal_transaction_value 65000000) (+ old 24)
                    (ite (> illegal_transaction_value 25000000) (+ old 22)
                        (ite (> illegal_transaction_value 9500000) (+ old 10)
                            (ite (> illegal_transaction_value 3500000) (+ old 18)
                                (ite (> illegal_transaction_value 1500000) (+ old 16)
                                    (ite (> illegal_transaction_value 550000) (+ old 14)
                                        (ite (> illegal_transaction_value 250000) (+ old 12)
                                            (ite (> illegal_transaction_value 150000) (+ old 10)
                                                (ite (> illegal_transaction_value 95000) (+ old 8)
                                                    (ite (> illegal_transaction_value 40000) (+ old 6)
                                                        (ite (> illegal_transaction_value 15000) (+ old 4)
                                                            (ite (< illegal_transaction_value 6500) (+ old 2)
                                                                old))))))))))))))))

(define-fun offense_C1.8_SOC_2 ((old Int)) Int
    (ite foreign_government
        (+ old 4)
        (ite foreign_national
            (+ old 2)
            old)
        old))

(define-fun offense_C1.8_SOC_3 ((old Int)) Int
    (ite (or government_funds non_monetary_benefit)
        (+ old 2)
        old))

(define-fun offense_C1.8_SOC_4 ((old Int)) Int
    (ite (>= illegal_transactions 30)
        (+ old 2)
        old))

(define-fun offense_C1.8_SOC_5 ((old Int)) Int
    (ite intimidation_harm_coercion
        (+ old 4)
        old))

; apply specific offense characteristics
(assert (=> offense_C1.8 (= offense_level
    (offense_C1.8_SOC_5
        (offense_C1.8_SOC_4
            (offense_C1.8_SOC_3
                (offense_C1.8_SOC_2
                    (offense_C1.8_SOC_1 base_offense_level))))))))

(check-sat)