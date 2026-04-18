#import "@preview/polylux:0.3.1": *
#import "unipd.typ": *

#show: unipd-theme
#title-slide(
  authors: "Luca Ribon",
  title: "Migrazione al protocollo MQTT in un sistema di monitoraggio e tracciamento di linee produzione basato su dispositivi RFID",
  subtitle: "Discussione di Laurea Triennale in Informatica",
  date: "Aprile 2026",
  top-gap: 15%,
  title-subtitle-gap: 0.8em,
  meta-gap: 4%,
)

#new-section-slide("Introduzione")

#slide(title: "KanbanBOX")[
]

// TODO: tenere in considerazione
// #slide(title: "Dynamic text")[
//   #lorem(20)

//   #uncover("2-")[This appears after one slide]
// ]

#new-section-slide("Conclusions")

#slide(title: "Qux")[
  _baz_\
  *Fizz*\
  `Fuzz`
]

#slide()[
  #normal-block[Normal block][body]
  #alert-block[Alert block][body]
  #example-block[Example block][
    body

    but a bit longer
  ]
]

#filled-slide[
  Grazie per l'attenzione
]
