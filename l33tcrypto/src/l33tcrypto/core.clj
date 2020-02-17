(ns l33tcrypto.core
  (:import java.util.Base64))

(defn encode [to-encode]
  (.encodeToString (Base64/getEncoder) (.getBytes to-encode)))

(defn apply-f-n-rounds [f n]
  (apply comp (repeat n f)))

(defn encrypt
  "Encode string str for n rounds"
  [str n]
  ((apply-f-n-rounds encode n) str))
