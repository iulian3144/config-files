
;;****************
;;* DEFFUTEMPLATE*
;;****************
(deftemplate laptop_template
    (slot laptop (default ?NONE))
    (multislot ltype (default ?NONE))
    (slot lmanufacturer (default ?NONE))
    (slot cpu_manufacturer (default ?NONE))
    (slot cpu_cores (default ?NONE))
    (slot video_board (default ?NONE))
)


;;*****************
;;*   LAPTOP DB   *
;;*****************
(deffacts laptop_template
    (laptop_template (laptop l1) (ltype gaming) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores 2) (video_board integrated))
    (laptop_template (laptop l2) (ltype gaming) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores 2) (video_board integrated))
    (laptop_template (laptop l3) (ltype gaming) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores 2) (video_board dedicated))
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
        (default))
   ; (if (eq ?answer gaming)
   ;     then gaming
   ; else
   ;     (if (eq ?answer multimedia)
   ;         then multimedia)
)

(deffunction choose_lmanufacturer (?question)
    (bind ?answer (ask_question ?question dell asus hp lenovo))
    (switch ?answer
        (case dell then dell)
        (case asus then asus)
        (case hp then hp)
        (case lenovo then lenovo)
        (default NONE)
    )
)

(deffunction choose_cmanufacturer (?question)
    (bind ?answer (ask_question ?question intel amd))
    (switch ?answer
        (case intel then intel)
        (case amd then amd)
        (default NONE)
    )
)

(deffunction choose_cpuc (?question)
    (bind ?answer (ask_question ?question 2 4))
    (switch ?answer
        (case 2 then 2)
        (case 4 then 4)
        (default NONE)
    )
)

(deffunction choose_video (?question)
    (bind ?answer (ask_question ?question integrata dedicata))
    (switch ?answer
        (case integrata then integrata)
        (case dedicata then dedicata)
        (default NONE)
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
    (assert (lmanufacturer (choose_lmanufacturer "Ce producator laptop doresti? (dell/asus/hp/lenovo)")))
)

(defrule cmanufacturer
    "Get cpu manufacturer" ; comment
    (not (cmanufacturer ?))
=>
    (assert (cmanufacturer (choose_cmanufacturer "Ce producator procesor doresti? (intel/amd)")))
)

(defrule cpuc
    "Get cpu # of cores" ; comment
    (not (cpuc ?))
=>
    (assert (cpuc (choose_cpuc "Cate nuclee procesor doresti? (2/4)")))
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

(defrule print_answer
    "Print answer eg.: l1"
    (declare (salience 10))
    (ltype $?ltype)
    (lmanufacturer ?lman)
    (cmanufacturer ?cman)
    (cpuc ?cores)
    (laptop_template (laptop ?ans) (ltype $?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?vboard))
    (laptop_template (laptop ?ans) (ltype ?) (lmanufacturer ?)   (cpu_manufacturer ?) (cpu_cores ?) (video_board ?))
=>
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)

)

