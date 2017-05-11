;; file: test.clp

;;****************
;;* DEFFUTEMPLATE*
;;****************
(deftemplate laptop_template
    (slot laptop (default ?NONE))
    (slot ltype (default ?NONE))
    (slot lmanufacturer (default ?NONE))
    (slot cpu_manufacturer (default ?NONE))
    (slot cpu_cores (default ?NONE))
    (slot video_board (default ?NONE))
)


;;*****************
;;*   LAPTOP DB   *
;;*****************
(deffacts laptop_template
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   GAMING   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (laptop_template (laptop  l1) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop  l2) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop  l3) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop  l4) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop  l5) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop  l6) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop  l7) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop  l8) (ltype gaming)     (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop  l9) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l10) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l11) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l12) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l13) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l14) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l15) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l16) (ltype gaming)     (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop l17) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l18) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l19) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l20) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l21) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l22) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l23) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l24) (ltype gaming)     (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop l25) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l26) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l27) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l28) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l29) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l30) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l31) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l32) (ltype gaming)     (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   MULTIMEDIA   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (laptop_template (laptop l33) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l34) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l35) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l36) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l37) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l38) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l39) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l40) (ltype multimedia) (lmanufacturer dell)   (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop l41) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l42) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l43) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l44) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l45) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l46) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l47) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l48) (ltype multimedia) (lmanufacturer asus)   (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop l49) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l50) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l51) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l52) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l53) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l54) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l55) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l56) (ltype multimedia) (lmanufacturer hp)     (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))

    (laptop_template (laptop l57) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l58) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l59) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l60) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 4) (video_board integrata))
    (laptop_template (laptop l61) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 2) (video_board dedicata))
    (laptop_template (laptop l62) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 2) (video_board integrata))
    (laptop_template (laptop l63) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 4) (video_board dedicata))
    (laptop_template (laptop l64) (ltype multimedia) (lmanufacturer lenovo) (cpu_manufacturer amd) (cpu_cores 4) (video_board integrata))
)


;;****************
;;* DEFFUNCTIONS *
;;****************
(deffunction ask_question (?question $?allowed_values)
    (format t "%-55s -> " ?question)
    (bind ?answer (read))
    (if (lexemep ?answer)
        then (bind ?answer (lowcase ?answer))
    )
    (while (not (member ?answer ?allowed_values)) do
        (format t "%-55s -> " ?question)
        ; (printout t ?question " -> ")
        (bind ?answer (read))
        (if (lexemep ?answer)
            then (bind ?answer (lowcase ?answer))
        )
    )
    ?answer
)


(deffunction choose_type (?question)
   (bind ?answer (ask_question ?question gaming multimedia nu))
   (switch ?answer
        (case gaming then gaming)
        (case multimedia then multimedia)
        (default)
    )
   ; (if (eq ?answer gaming)
   ;     then gaming
   ; else
   ;     (if (eq ?answer multimedia)
   ;         then multimedia)
)

(deffunction choose_lmanufacturer (?question)
    (bind ?answer (ask_question ?question dell asus hp lenovo nu))
    (switch ?answer
        (case dell then dell)
        (case asus then asus)
        (case hp then hp)
        (case lenovo then lenovo)
        (default)
    )
)

(deffunction choose_cmanufacturer (?question)
    (bind ?answer (ask_question ?question intel amd nu))
    (switch ?answer
        (case intel then intel)
        (case amd then amd)
        (default)
    )
)

(deffunction choose_cpuc (?question)
    (bind ?answer (ask_question ?question 2 4 nu))
    (switch ?answer
        (case 2 then 2)
        (case 4 then 4)
        (default)
    )
)

(deffunction choose_video (?question)
    (bind ?answer (ask_question ?question integrata dedicata nu))
    (switch ?answer
        (case integrata then integrata)
        (case dedicata then dedicata)
        (default)
    )
)
;;****************
;;* DEFFRULES    *
;;****************

(defrule ltype
    "Get laptop type" ; comment
    (not (ltype $?))
    (not (answer ?))
=>
    (bind ?ans (choose_type "Ce tip de laptop doresti? (gaming/multimedia/nu)"))
    (if (eq ?ans FALSE)
        then (assert (ltype))
    else
        (assert (ltype ?ans)))
    ; (assert (ltype (choose_type "Ce tip de laptop doresti? (gaming/multimedia/nu)")))
)

(defrule lmanufacturer
    "Get laptop manufacturer" ; comment
    (not (lmanufacturer ?))
=>
    (bind ?ans (choose_lmanufacturer "Ce producator laptop doresti? (dell/asus/hp/lenovo/nu)"))
    (if (eq ?ans FALSE)
        then (assert (lmanufacturer))
    else
        (assert (lmanufacturer ?ans)))
)

(defrule cmanufacturer
    "Get cpu manufacturer" ; comment
    (not (cmanufacturer ?))
=>
    (bind ?ans (choose_cmanufacturer "Ce producator procesor doresti? (intel/amd/nu)"))
    (if (eq ?ans FALSE)
        then (assert (cmanufacturer))
    else
        (assert (cmanufacturer ?ans)))
)

(defrule cpuc
    "Get cpu # of cores" ; comment
    (not (cpuc ?))
=>
    (bind ?ans (choose_cpuc "Cate nuclee procesor doresti? (2/4/nu)"))
    (if (eq ?ans FALSE)
        then (assert (cpuc))
    else
        (assert (cpuc ?ans)))
    (assert (answer))
)

(defrule vboard
    "Get video board type" ; comment
    (not (vboard ?))
=>
    (bind ?ans (choose_video "Ce tip de placa video doresti? (integrata/dedicata/nu)"))
    (if (eq ?ans FALSE)
        then (assert (vboard))
    else
        (assert (vboard ?ans)))
    (assert (answer))
)

;; This is the first rule that will fire
(defrule init
    "Initializing rule"
    (declare (salience 110))
=>
    (printout t crlf)
    (printout t "==== Recomandari laptop ====")
    (printout t crlf crlf)
)

(defrule print_answer0
    "Print answer 0"
    (declare (salience 10))
    (ltype ?ltype)
    (lmanufacturer ?lman)
    (cmanufacturer ?cman)
    (cpuc ?cores)
    (vboard ?vboard)
    (answer)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?vboard))
=>
    (printout t "[0]Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

(defrule print_answer1
    "Print answer 1"
    (declare (salience 10))
    (not (ltype ?))
    (lmanufacturer ?lman)
    (cmanufacturer ?cman)
    (cpuc ?cores)
    (vboard ?vboard)
    (answer)
    (laptop_template (laptop ?ans) (ltype ?) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?vboard))
=>
    (printout t "[1]Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

(defrule print_answer2
    "Print answer 2"
    (declare (salience 10))
    (ltype ?ltype)
    (not (lmanufacturer ?))
    (cmanufacturer ?cman)
    (cpuc ?cores)
    (vboard ?vboard)
    (answer)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?vboard))
=>
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

(defrule print_answer3
    "Print answer 3"
    (declare (salience 10))
    (ltype ?ltype)
    (lmanufacturer ?lman)
    (not (cmanufacturer ?))
    (cpuc ?cores)
    (vboard ?vboard)
    (answer)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?) (cpu_cores ?cores) (video_board ?vboard))
=>
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

(defrule print_answer4
    "Print answer 4"
    (declare (salience 10))
    (ltype ?ltype)
    (lmanufacturer ?lman)
    (cmanufacturer ?cman)
    (not (cpuc ?))
    (vboard ?vboard)
    (answer)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?) (video_board ?vboard))
=>
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

(defrule print_answer5
    "Print answer 5"
    (declare (salience 10))
    (ltype ?ltype)
    (lmanufacturer ?lman)
    (cmanufacturer ?cman)
    (cpuc ?cores)
    (not (vboard ?))
    (answer)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?))
=>
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)
)

; (load "test.clp")
; (reset)
; (run)
