document.addEventListener("DOMContentLoaded", () => {
    const input = document.getElementById("searchInput");
    const resultsDiv = document.getElementById("searchResults");

    if (!input || !resultsDiv) return;

    input.addEventListener("keyup", function () {
        const query = this.value.trim();

        if (query.length < 2) {
            resultsDiv.style.display = "none";
            resultsDiv.innerHTML = "";
            return;
        }

        fetch("RicercaServlet?q=" + encodeURIComponent(query))
            .then(response => response.json())
			.then(data => {
			    if (data.length === 0) {
			        resultsDiv.innerHTML = "<div style='padding:10px;'>Nessun risultato</div>";
			    } else {
			        resultsDiv.innerHTML = data.map(p => `
			            <div class="search-item" onclick="window.location.href='Prodotto?id=${p.id}'">
			                <img src="img/prodotto${p.id}.jpg" alt="${p.nome}" onerror="this.style.display='none'">
			                <div class="search-text">
			                    <h4>${p.nome}</h4>
			                    <span>${p.prezzo}€</span>
			                </div>
			            </div>
			        `).join("");
			    }

			    // Mostra il box
			    resultsDiv.style.display = "block";
			})

            .catch(err => {
                console.error("Errore durante la ricerca AJAX:", err);
                resultsDiv.style.display = "none";
            });
    });

    // Chiudi risultati se clicchi fuori
    document.addEventListener("click", (e) => {
        if (!resultsDiv.contains(e.target) && e.target !== input) {
            resultsDiv.style.display = "none";
        }
    });
});

