(ns main
  (:gen-class)
  (:require
   [l33tcrypto.core :as l33tcrypto]))

(defn -main [string rounds]
  (println
    (l33tcrypto/encrypt string
      (Integer/parseInt rounds))))