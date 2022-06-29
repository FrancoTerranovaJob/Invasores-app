class InvadersPhotos {
  static String getInvaderPhoto(String name) {
    switch (name) {
      case 'Darth Vader':
        return 'https://www.geekmi.news/__export/1610376368887/sites/debate/img/2021/01/11/poder-darth-vader_crop1610376344796.jpg_375107944.jpg';
      case 'Luke Skywalker':
        return 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/luke-skywalker-muerte-guion-original-1602697056.jpg';
      case 'C-3PO':
        return 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/ojos-rojos-c3po-star-wars-1566913065.jpg';
      case 'R2-D2':
        return 'https://cdn-e360.s3-sa-east-1.amazonaws.com/r2-d2-fue-el-culpable-de-la-muerte-de-obi-wan-el-heroe-villano-de-star-wars-large-vTYxmComAC.jpg';
      case 'Leia Organa':
        return 'https://static.wikia.nocookie.net/esstarwars/images/9/9b/Princessleiaheadwithgun.jpg/revision/latest?cb=20150117214124';
      case 'Obi-Wan Kenobi':
        return 'https://cloudfront-us-east-1.images.arcpublishing.com/infobae/5Q3MP3OIIRHZDK7YJXDTIPYAPE.png';
      default:
        return 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Star_Wars_Logo.svg/2560px-Star_Wars_Logo.svg.png';
    }
  }
}
