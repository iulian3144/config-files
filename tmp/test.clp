
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
    (laptop_template (laptop l1) (ltype gaming) (lmanufacturer lenovo) (cpu_manufacturer intel) (cpu_cores two) (video_board integrated))
    (laptop_template (laptop l2) (ltype gaming) (lmanufacturer hp)     (cpu_manufacturer intel) (cpu_cores two) (video_board integrated))
    (laptop_template (laptop l3) (ltype gaming) (lmanufacturer dell)   (cpu_manufacturer intel) (cpu_cores two) (video_board dedicated))
)


;;****************
;;* DEFFUNCTIONS *
;;****************
(deffunction ask_question (?question $?allowed_values)
    (printout t ?question)
    (bind ?answer (read))
    (if (lexemep ?answer)
        then (bind ?answer (lowcase ?answer))
    )
    (while (not (member ?answer ?allowed_values)) do
        (printout t ?question)
        (bind ?answer (read))
        (if (lexemep ?answer)
            then (bind ?answer (lowcase ?answer))
        )
    )
    ?answer
)


(deffunction choose_type (?question)
   (bind ?answer (ask_question ?question gaming multimedia))
   (if (eq ?answer gaming)
       then gaming
       else multimedia)
)


;;****************
;;* DEFFRULES    *
;;****************

(defrule type
    "Get laptop type" ; comment
    (not (ltype ?))
    (not (answer ?))
=>
    (assert (ltype (choose_type "Ce tip de laptop doresti? (gaming/multimedia)")))
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
    (ltype ?item)
    (laptop_template (laptop ?ans) (ltype ?ltype) (lmanufacturer ?lman)   (cpu_manufacturer ?cman) (cpu_cores ?cores) (video_board ?vboard))
=>
    (printout t crlf)
    (printout t "Recomandare: ")
    (format t "%s" ?ans)
    (printout t crlf)

)

