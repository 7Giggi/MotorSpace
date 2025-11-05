function mostraErrore(elemento, messaggio) {
    let errore = elemento.nextElementSibling
    if (!errore || !errore.classList.contains("errore")) {
        errore = document.createElement("span")
        errore.classList.add("errore")
        errore.style.color = "red"
        errore.style.display = "block"
        elemento.parentNode.insertBefore(errore, elemento.nextSibling)
    }
    errore.textContent = messaggio
}

function rimuoviErrore(elemento) {
    const errore = elemento.nextElementSibling
    if (errore && errore.classList.contains("errore")) {
        errore.remove()
    }
}

function validaProdotto() {
    const nome = document.querySelector("[name='nome']")
    const descrizione = document.querySelector("[name='descrizione']")
    const marca = document.querySelector("[name='marca']")
    const prezzo = document.querySelector("[name='prezzo']")
    const categoria = document.querySelector("[name='addCategoria']")

    const regexNome = /^[ a-zA-Z0-9]{1,50}$/
    const regexDescrizione = /^[ a-zA-Z0-9]{1,200}$/
    const regexMarca = /^[ a-zA-Z0-9]{1,50}$/
    const regexPrezzo = /^\d{1,6}(\.\d{1,2})?$/

    let valido = true
    let primoErrore = null



    if (!regexNome.test(nome.value.trim())) {
        mostraErrore(nome, "Il nome può contenere lettere e numeri (max 50 caratteri).")
        valido = false
        if (!primoErrore) primoErrore = nome
    } else rimuoviErrore(nome)

    if (!regexDescrizione.test(descrizione.value.trim())) {
        mostraErrore(descrizione, "La descrizione può contenere lettere e numeri (max 200 caratteri).")
        valido = false
        if (!primoErrore) primoErrore = descrizione
    } else rimuoviErrore(descrizione)

    if (!regexMarca.test(marca.value.trim())) {
        mostraErrore(marca, "La marca può contenere lettere e numeri (max 50 caratteri).")
        valido = false
        if (!primoErrore) primoErrore = marca
    } else rimuoviErrore(marca)

    if (!regexPrezzo.test(prezzo.value)) {
        mostraErrore(prezzo, "Prezzo non valido (es. 10 o 10.99).")
        valido = false
        if (!primoErrore) primoErrore = prezzo
    } else rimuoviErrore(prezzo)

    if (!categoria.value || categoria.value === "") {
        mostraErrore(categoria, "Seleziona una categoria.")
        valido = false
        if (!primoErrore) primoErrore = categoria
    } else rimuoviErrore(categoria)

    if (!valido && primoErrore) {
        primoErrore.focus()
    }

    return valido
}

document.addEventListener("DOMContentLoaded", () => {
	const campi = document.querySelectorAll("[name='nome'], [name='descrizione'], [name='marca'], [name='prezzo']")
    campi.forEach(campo => {
        campo.addEventListener("blur", validaProdotto)
    })
})

