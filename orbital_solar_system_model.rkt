;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname orbital_solar_system_model) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH 1400)
(define HEIGHT 850)

(define CENTER-X (/ WIDTH 2))
(define CENTER-Y (/ HEIGHT 2))

(define SPACE (rectangle WIDTH HEIGHT "solid" "black"))

(define-struct planet (distance speed color))

(define sun (circle 40 "solid" "gold"))

(define mercury-info (make-planet 60 10 "silver"))
(define mercury (circle 4 "solid" "silver"))

(define venus-info (make-planet 80 25 "bisque"))
(define venus (circle 7 "solid" "bisque"))

(define earth-info (make-planet 105 40 "royalblue"))
(define earth (circle 8 "solid" "royalblue"))


(define moon-info (make-planet 15 3 "lightgray")) 
(define moon (circle 2 "solid" "lightgray"))


(define mars-info (make-planet 130 75 "firebrick"))
(define mars (circle 5 "solid" "firebrick"))

(define jupiter-info (make-planet 180 150 "burlywood"))
(define jupiter (circle 20 "solid" "burlywood"))

(define saturn-info (make-planet 235 250 "navajowhite"))
(define saturn (circle 17 "solid" "navajowhite"))
          
(define uranus-info (make-planet 305 400 "powderblue"))
(define uranus (circle 12 "solid" "powderblue"))

(define neptune-info (make-planet 360 700 "blue"))
(define neptune (circle 12 "solid" "blue"))

(define pluto-info (make-planet 410 900 "rosybrown"))
(define pluto (circle 3 "solid" "rosybrown"))


(define (draw-planet info image ticks background)
  (place-image
   image
   (+ CENTER-X (* (planet-distance info)  (cos (/ ticks (planet-speed info)))))
   (+ CENTER-Y (* (planet-distance info)  (sin (/ ticks (planet-speed info)))))
   background))

(define (draw-orbit info background)
  (place-image
   (circle (planet-distance info) "outline" (planet-color info))
  CENTER-X
  CENTER-Y
  background))

(define (draw-moon image info earth-x earth-y ticks background)
  (place-image
   image
   (+ earth-x (* (planet-distance info) (cos (/ ticks (planet-speed info)))))
   (+ earth-y (* (planet-distance info) (sin (/ ticks (planet-speed info)))))
   background))


(define (solar-system ticks)
  (draw-orbit pluto-info 
  (draw-orbit neptune-info 
  (draw-orbit uranus-info 
  (draw-orbit saturn-info 
  (draw-orbit jupiter-info 
  (draw-orbit mars-info 
  (draw-orbit earth-info 
  (draw-orbit venus-info 
  (draw-orbit mercury-info 


             
  (draw-planet pluto-info pluto ticks
  (draw-planet neptune-info neptune ticks
  (draw-planet uranus-info uranus ticks
  (draw-planet saturn-info saturn ticks
  (draw-planet jupiter-info jupiter ticks
  (draw-planet mars-info mars ticks
  (draw-planet earth-info earth ticks
  (draw-planet venus-info venus ticks
  (draw-planet mercury-info mercury ticks
  (draw-moon moon
             moon-info
             (+ CENTER-X (* (planet-distance earth-info) (cos (/ ticks (planet-speed earth-info))))) 
             (+ CENTER-Y (* (planet-distance earth-info) (sin (/ ticks (planet-speed earth-info))))) 
                         ticks

                             
  (place-image sun CENTER-X CENTER-Y SPACE)))))))))))))))))))))

  (animate solar-system)