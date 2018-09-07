pacman::p_load(sp, 
               rgdal, 
               tmap, 
               RColorBrewer, 
               viridis, 
               classInt)


capa <- readOGR("Faltas", "agebs_tandeo_reloaded")

summary(capa)
plot(capa)

proj4string(capa)
str(capa, max.level = 2)

str(capa@data)

paleta <- c('#FFFFFF', '#edf8e9','#bae4b3','#74c476','#31a354','#006d2c')

tm_shape(capa) +
  tm_fill(title = "Días sin agua \n (promedio)", 
          col = "S_AGUA", palette = paleta,
          style = "fixed", 
          breaks = c(0, 1, 50, 100, 150, 200, 250)) +
  tm_borders(alpha = 0.2) +
  tm_layout(fontfamily = "Palatino")

tmap_save(filename = "faltas.html")
tmap_save(filename = "faltas.png", dpi = 600, width = 8, height = 9)

