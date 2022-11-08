class Sitio {
  final String nombre;
  final String descripcion;
  final String foto;
  final double puntuacion;

  Sitio(
    this.nombre,
    this.descripcion,
    this.foto,
    this.puntuacion,
  );
}

List<Sitio> sitios = [
  Sitio(
      "Castillo San Felipe de Barajas",
      "El Castillo San Felipe de Barajas es una fortificación localizada en la ciudad de Cartagena de Indias en Colombia. Su nombre real es Fuerte de San Felipe de Barajas. Está situado sobre un cerro llamado San Lázaro y fue construido en 1657 durante la época colonial española. Sufrió constantes asedios por parte de los ingleses y franceses, siendo el comandante francés Barón de Pointis quien tomara el castillo a mediados de 1697.",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/62_-_Carthag%C3%A8ne_-_D%C3%A9cembre_2008.jpg/1920px-62_-_Carthag%C3%A8ne_-_D%C3%A9cembre_2008.jpg",
      4.5),
  Sitio(
      "Playa de la Península de Barú",
      "La península de Barú (a veces denominada Isla de Barú o simplemente Barú), es una zona costera situada al sur y a 45 minutos en lancha de Cartagena de Indias, Colombia, famosa por sus playas blancas y agua turquesa. Está separada del territorio por el Canal del Dique. Hasta 2014, la única forma de cruzarlo era en balsa, o sus variantes. Fue en ese año cuando se inauguró el llamado Puente de Barú.",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/012_Playa_Blanca_from_the_Boat.JPG/1280px-012_Playa_Blanca_from_the_Boat.JPG",
      5.0),
  Sitio(
      "Volcán de Lodo El Totumo",
      "El volcán del Totumo es un cono volcánico lleno de lodo, que se encuentra ubicado en la zona rural del municipio de Santa Catalina (Bolívar), en la Región Caribe de Colombia, junto a la Ciénaga del Totumo y cerca de la frontera con el departamento del Atlántico. Los corregimientos de Loma de Arena, Galerazamba y Pueblo Nuevo son los más cercanos al mismo. La formación presenta una escasa elevación (aproximadamente de veinte metros) para llegar a su cráter es preciso ascender por una rústica escalera de madera.",
      "https://restagenciaturistica.com/wp-content/uploads/elementor/thumbs/volcan-del-totumo-cartagena-colombia-1-e1571419653479-ofetbtwtbzizkrr402bl38xd6dcn992xydvon2eyqg.jpg",
      4.2),
];
