document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("formRegistrazione");
    const username = document.getElementById("username");
    const password = document.getElementById("password");
    const passwordConferma = document.getElementById("passwordConferma");
    const nome = document.getElementById("nome");
    const cognome = document.getElementById("cognome");
    const email = document.getElementById("email");

    form.addEventListener("submit", function(event) {
        let error = "";

        const usernameRegex = /^[0-9a-zA-Z]{6,30}$/;
        if (!usernameRegex.test(username.value)) {
            error = "Username non valido: deve contenere solo lettere e numeri (6-30 caratteri).";
        }

        if (!error) {
            if (!(password.value.length >= 8 &&
                password.value.toUpperCase() !== password.value &&
                password.value.toLowerCase() !== password.value &&
                /\d/.test(password.value))) {
                error = "Password non valida: deve avere almeno 8 caratteri, una lettera maiuscola, una minuscola e un numero.";
            }
        }

        if (!error && password.value !== passwordConferma.value) {
            error = "Le password non coincidono.";
        }

        const nomeRegex = /^[a-zA-Z]{1,30}$/;
        if (!error && !nomeRegex.test(nome.value.trim())) {
            error = "Nome non valido: solo lettere, massimo 30 caratteri.";
        }

        const cognomeRegex = /^[ a-zA-Z]{1,30}$/;
        if (!error && !cognomeRegex.test(cognome.value.trim())) {
            error = "Cognome non valido: solo lettere, massimo 30 caratteri.";
        }

        const emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w+)$/;
        if (!error && !emailRegex.test(email.value)) {
            error = "Email non valida.";
        }

        if (error) {
            event.preventDefault();
            alert(error);
        }
    });
});
