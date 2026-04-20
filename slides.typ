#import "@preview/polylux:0.4.0": *
#import "unipd.typ": *

#show: unipd-theme
#title-slide(
    authors: "Luca Ribon",
    title: "Migrazione al protocollo MQTT in un sistema di monitoraggio e tracciamento di linee produzione basato su dispositivi RFID",
    subtitle: "Discussione di Laurea Triennale in Informatica",
    date: "22 Aprile 2026",
    top-gap: 15%,
    title-subtitle-gap: 0.8em,
    meta-gap: 4%,
)

// ?tenere le new section slide dato che hanno lo stesso titolo che viene riportato su ogni slide della sezione ???
#new-section-slide("Introduzione")

#slide(title: "KanbanBOX")[
    #grid(
        columns: (7fr, 3fr),
        column-gutter: 2.4em,
        [
            - *monitoraggio* dei materiali di produzione
            - metodologia *Kanban*
            - visualizzazione e gestione delle entità kanban tramite *interfaccia web*
            - lettura dei cartellini tramite barcode o *RFID*
        ],
        [
            #align(right, figure(image("img/KbB_logo_icon.jpg", width: 85%)))
        ],
    )
]

#slide(title: "Scopo del progetto")[
    #grid(
        columns: (7fr, 3fr),
        column-gutter: 2.4em,
        [
            #align(
                horizon,
                [
                    - migrazione al protocollo *MQTT* per le comunicazioni con i reader RFID
                    - *configurazione da remoto* dei reader RFID
                ],
            )
        ],
        [
            #figure(image("img/mqtt-ver.jpg", width: 100%))
        ],
    )
]

// TODO: tenere in considerazione
// #slide(title: "Dynamic text")[
//   #lorem(20)

//   #uncover("2-")[This appears after one slide]
// ]

#new-section-slide("Architettura e Implementazione")

#slide(title: "Sistema esistente")[
    #figure(image("img/old_arch_diagram.png", width: 90%))
]

#slide(title: "Sistema implementato")[
    #figure(image("img/data_flow_diagram.png", width: auto))
]

#slide(title: "Reader e MQTT")[
    #toolbox.side-by-side(
        [
            - connessione tramite *AWS IoT Connector*
            - trasmette i dati di *lettura dei tag RFID* e gli *heartbeat*
            - può ricevere comandi MQTT di *configurazione*
            #figure(image("img/rfid-antenna.jpg", width: 65%))
        ],
        [
            #figure(image("./img/FX9600.jpg", width: 85%))
            - MQTT si basa su un modello *publish/subscribe*
            - i canali di comunicazione di MQTT vengono detti *topic*
        ],
    )
]

#slide(title: "AWS IoT Core")[
    #grid(
        columns: (7fr, 3fr),
        column-gutter: 1.5em,
        [
          #align(
            horizon,
            [
              - servizio *cloud* per la gestione di *dispositivi IoT*
              - integra un *broker MQTT*
              - instrada i messaggi MQTT tramite le *IoT Rule*
            ]
          )
        ],
        [
            #figure(image("img/IoT Core.png", width: 80%))
        ],
    )
]

#slide(title: "AWS SQS")[
    #grid(
        columns: (7fr, 3fr),
        column-gutter: 1.5em,
        [
          #align(
            horizon,
            [
            - servizio *cloud* per la gestione di *code di messaggi*
            - il backend di KanbanBOX esegue il *polling da delle code SQS*
            ]
          )
        ],
        [
            #figure(image("img/Simple Queue Service.png", width: 80%))
        ],
    )
]

#new-section-slide("Codifica")

#slide(title: "Librerie e framework")[
    #grid(
        columns: (1fr, 1fr),
        column-gutter: 2em,
        [
            #align(
                center + horizon,
                [
                    #figure(image("img/Amazon_Web_Services_Logo.svg.png", width: 55%))
                    *SDK di AWS IoT per PHP*
                ],
            )
        ],
        [
            #align(
                center + horizon,
                [
                    #figure(image("img/mqtt-ver.jpg", width: 70%))
                    *php-mqtt (Open Source)*
                ],
            )
        ],
    )
]

#slide(title: "Logica di dominio")[
    #grid(
        columns: (1.5fr, 1fr),
        [
            - *adattamento* al layer di *AWS IoT*
            - sostituzione di HTTP con *MQTT*
            - implementazione di un worker per il *polling da SQS*
            - *aggiornamento* di componenti esistenti
        ],
        [
          #align(
            center + horizon,
            figure(image("img/new-php-logo.png", width: 70%))
          )
        ],
    )

]



// #new-section-slide("Conclusions")

// #slide(title: "Qux")[
//   _baz_\
//   *Fizz*\
//   `Fuzz`
// ]

// #slide()[
//   #normal-block[Normal block][body]
//   #alert-block[Alert block][body]
//   #example-block[Example block][
//     body

//     but a bit longer
//   ]
// ]

#filled-slide[
    Grazie per l'attenzione
]
