set.seed(42)
species <- c("Dolphin", "Shark", "Whale", "Seal", "Tuna")
n <- 200
data <- data.frame(
  Species = sample(species, n, replace = TRUE),
  Length = rnorm(n, mean = 100, sd = 30),  
  Weight = rnorm(n, mean = 300, sd = 150)  
)


species_colors <- c("Dolphin" = "blue", "Shark" = "gray", "Whale" = "black", "Seal" = "brown", "Tuna" = "green")


plot(data$Length, data$Weight, main="Visualisation des animaux marins",
     xlab="Longueur (cm)", ylab="Poids (kg)",
     pch=19, col=species_colors[data$Species], cex=1.5)


for (sp in species) {
  species_data <- subset(data, Species == sp)
  model <- lm(Weight ~ Length, data = species_data)
  abline(model, col = species_colors[sp], lwd = 2)
}


legend("topright", legend=species,
       col=species_colors, pch=19, title="Espèces")


text(60, 600, labels="Visualisation des relations longueur-poids", pos=4, cex=0.8, col="blue")
