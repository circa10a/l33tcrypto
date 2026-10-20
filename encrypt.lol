BTW lci HAS NO ARGV SO U GIVE IT 1 LINE ON STDIN: secret rounds
HAI 1.3
CAN HAS STRING?

I HAS A ascii ITZ " !:"#$%&'()*+,-./0123456789::;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
I HAS A b64 ITZ "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
I HAS A ord ITZ A BUKKIT
I HAS A unb64 ITZ A BUKKIT

IM IN YR fill UPPIN YR i TIL BOTH SAEM i AN 95
  ord HAS A SRS I IZ STRING'Z AT YR ascii AN YR i MKAY ITZ SUM OF i AN 32
IM OUTTA YR fill

IM IN YR fill UPPIN YR j TIL BOTH SAEM j AN 64
  unb64 HAS A SRS I IZ STRING'Z AT YR b64 AN YR j MKAY ITZ j
IM OUTTA YR fill

HOW IZ I chr YR n
  FOUND YR I IZ STRING'Z AT YR ascii AN YR DIFF OF n AN 32 MKAY
IF U SAY SO

HOW IZ I sextet YR n
  FOUND YR I IZ STRING'Z AT YR b64 AN YR n MKAY
IF U SAY SO

HOW IZ I slice YR s AN YR from AN YR til
  I HAS A out ITZ ""
  IM IN YR chars UPPIN YR k TIL BOTH SAEM k AN DIFF OF til AN from
    out R SMOOSH out AN I IZ STRING'Z AT YR s AN YR SUM OF from AN k MKAY MKAY
  IM OUTTA YR chars
  FOUND YR out
IF U SAY SO

HOW IZ I allin YR s AN YR set
  I HAS A len ITZ I IZ STRING'Z LEN YR s MKAY
  I HAS A setlen ITZ I IZ STRING'Z LEN YR set MKAY
  I HAS A found
  IM IN YR chars UPPIN YR i TIL BOTH SAEM i AN len
    found R FAIL
    IM IN YR members UPPIN YR j TIL BOTH SAEM j AN setlen
      BOTH SAEM I IZ STRING'Z AT YR s AN YR i MKAY AN I IZ STRING'Z AT YR set AN YR j MKAY
      O RLY?
        YA RLY, found R WIN
      OIC
    IM OUTTA YR members
    NOT found, O RLY?
      YA RLY, FOUND YR FAIL
    OIC
  IM OUTTA YR chars
  FOUND YR WIN
IF U SAY SO

HOW IZ I encode YR s
  I HAS A len ITZ I IZ STRING'Z LEN YR s MKAY
  I HAS A chunks ITZ QUOSHUNT OF SUM OF len AN 2 AN 3
  I HAS A out ITZ ""
  I HAS A i
  I HAS A left
  I HAS A n
  IM IN YR chunk UPPIN YR k TIL BOTH SAEM k AN chunks
    i R PRODUKT OF k AN 3
    left R DIFF OF len AN i
    n R PRODUKT OF ord'Z SRS I IZ STRING'Z AT YR s AN YR i MKAY AN 65536
    BOTH SAEM left AN BIGGR OF left AN 2, O RLY?
      YA RLY, n R SUM OF n AN PRODUKT OF ord'Z SRS I IZ STRING'Z AT YR s AN YR SUM OF i AN 1 MKAY AN 256
    OIC
    BOTH SAEM left AN BIGGR OF left AN 3, O RLY?
      YA RLY, n R SUM OF n AN ord'Z SRS I IZ STRING'Z AT YR s AN YR SUM OF i AN 2 MKAY
    OIC

    out R SMOOSH out AN I IZ sextet YR QUOSHUNT OF n AN 262144 MKAY AN I IZ sextet YR MOD OF QUOSHUNT OF n AN 4096 AN 64 MKAY MKAY
    BOTH SAEM left AN BIGGR OF left AN 2, O RLY?
      YA RLY, out R SMOOSH out AN I IZ sextet YR MOD OF QUOSHUNT OF n AN 64 AN 64 MKAY MKAY
      NO WAI, out R SMOOSH out AN "=" MKAY
    OIC
    BOTH SAEM left AN BIGGR OF left AN 3, O RLY?
      YA RLY, out R SMOOSH out AN I IZ sextet YR MOD OF n AN 64 MKAY MKAY
      NO WAI, out R SMOOSH out AN "=" MKAY
    OIC
  IM OUTTA YR chunk
  FOUND YR out
IF U SAY SO

HOW IZ I decode YR s
  I HAS A len ITZ I IZ STRING'Z LEN YR s MKAY
  I HAS A chunks ITZ QUOSHUNT OF len AN 4
  I HAS A out ITZ ""
  I HAS A i
  I HAS A c2
  I HAS A c3
  I HAS A n
  IM IN YR chunk UPPIN YR k TIL BOTH SAEM k AN chunks
    i R PRODUKT OF k AN 4
    c2 R I IZ STRING'Z AT YR s AN YR SUM OF i AN 2 MKAY
    c3 R I IZ STRING'Z AT YR s AN YR SUM OF i AN 3 MKAY
    n R SUM OF PRODUKT OF unb64'Z SRS I IZ STRING'Z AT YR s AN YR i MKAY AN 262144 AN PRODUKT OF unb64'Z SRS I IZ STRING'Z AT YR s AN YR SUM OF i AN 1 MKAY AN 4096
    DIFFRINT c2 AN "=", O RLY?
      YA RLY, n R SUM OF n AN PRODUKT OF unb64'Z SRS c2 AN 64
    OIC
    DIFFRINT c3 AN "=", O RLY?
      YA RLY, n R SUM OF n AN unb64'Z SRS c3
    OIC

    out R SMOOSH out AN I IZ chr YR QUOSHUNT OF n AN 65536 MKAY MKAY
    DIFFRINT c2 AN "=", O RLY?
      YA RLY, out R SMOOSH out AN I IZ chr YR MOD OF QUOSHUNT OF n AN 256 AN 256 MKAY MKAY
    OIC
    DIFFRINT c3 AN "=", O RLY?
      YA RLY, out R SMOOSH out AN I IZ chr YR MOD OF n AN 256 MKAY MKAY
    OIC
  IM OUTTA YR chunk
  FOUND YR out
IF U SAY SO

HOW IZ I crypto YR s AN YR rounds AN YR method
  IM IN YR round UPPIN YR r TIL BOTH SAEM r AN rounds
    BOTH SAEM method AN "encrypt", O RLY?
      YA RLY, s R I IZ encode YR s MKAY
      NO WAI, s R I IZ decode YR s MKAY
    OIC
  IM OUTTA YR round
  FOUND YR s
IF U SAY SO

I HAS A line
GIMMEH line
I HAS A linelen ITZ I IZ STRING'Z LEN YR line MKAY
I HAS A gap ITZ -1
IM IN YR scan UPPIN YR p TIL BOTH SAEM p AN linelen
  BOTH SAEM I IZ STRING'Z AT YR line AN YR p MKAY AN " ", O RLY?
    YA RLY, gap R p
  OIC
IM OUTTA YR scan

I HAS A secret ITZ ""
I HAS A rounds ITZ ""
DIFFRINT gap AN -1, O RLY?
  YA RLY
    secret R I IZ slice YR line AN YR 0 AN YR gap MKAY
    rounds R I IZ slice YR line AN YR SUM OF gap AN 1 AN YR linelen MKAY
OIC

BOTH OF I IZ allin YR secret AN YR ascii MKAY AN BOTH OF DIFFRINT rounds AN "" AN I IZ allin YR rounds AN YR "0123456789" MKAY
O RLY?
  YA RLY
    rounds IS NOW A NUMBR
    I HAS A encrypted ITZ I IZ crypto YR secret AN YR rounds AN YR "encrypt" MKAY
    VISIBLE ":"encrypted:" " encrypted
    VISIBLE ":"decrypted:" " I IZ crypto YR encrypted AN YR rounds AN YR "decrypt" MKAY
  NO WAI
    VISIBLE "O NOES. Expects 1 line on stdin: <string:printable ascii> <int:times>"
OIC
KTHXBYE
