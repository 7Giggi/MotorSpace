function validaProdottoModifica() {
    let id = document.getElementById("idStr").value.trim();
    let nome = document.getElementById("nome").value.trim();
    let descrizione = document.getElementById("descrizione").value.trim();
    let marca = document.getElementById("marca").value.trim();
    let prezzo = document.getElementById("prezzo").value.trim();
    let categoria = document.getElementById("addCategoria").value.trim();

    let valid = true;

    pulisciErrori();

    if (!/^[0-9]{1,10}$/.test(id)) {
        mostraErrore("errore-id", "L'ID deve essere un numero valido (1-10 cifre).");
        valid = false;
    }

    if (nome === "" || !/^[ a-zA-Z0-9]{1,50}$/.test(nome)) {
        mostraErrore("errore-nome", "Nome non valido.");
        valid = false;
    }

    if (descrizione === "" || !/^[ a-zA-Z0-9]{1,200}$/.test(descrizione)) {
        mostraErrore("errore-descrizione", "Descrizione non valida.");
        valid = false;
    }

    if (marca === "" || !/^[ a-zA-Z0-9]{1,50}$/.test(marca)) {
        mostraErrore("errore-marca", "Marca non valida.");
        valid = false;
    }

    if (prezzo === "" || !/^\d{1,6}(\.\d{1,2})?$/.test(prezzo)) {
        mostraErrore("errore-prezzo", "Prezzo non valido.");
        valid = false;
    }

    if (categoria === "" || isNaN(categoria)) {
        mostraErrore("errore-categoria", "Categoria non valida.");
        valid = false;
    }

    return valid;
}

function mostraErrore(idCampo, messaggio) {
    let span = document.getElementById(idCampo);
    if (span) {
        span.textContent = messaggio;
        span.style.color = "red";
    }
}

function pulisciErrori() {
    let errori = document.querySelectorAll(".errore");
    errori.forEach(e => e.textContent = "");
}
