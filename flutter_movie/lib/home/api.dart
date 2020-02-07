const api = 'http://mobile.bwstudent.com/'; //轮播图
const servicePath = {
  'banner': api + 'movieApi/tool/v2/banner', // 商家首页信息
  'findReleaseMovieList':
      api + 'movieApi/movie/v2/findReleaseMovieList?page=1&&count=5', // 商家首页信息
  'findComingSoonMovieList': api +
      'movieApi/movie/v2/findComingSoonMovieList?page=1&&count=5', // 商家首页信息
  'findHotMovieList':
      api + 'movieApi/movie/v2/findHotMovieList?page=1&&count=10', // 商家首页信息
  'COMMEND': api +
      'movieApi/cinema/v1/findRecommendCinemas?page=1&&count=10', // 商家首页信息
  'NEARBY':
      api + 'movieApi/cinema/v1/findNearbyCinemas?page=1&&count=10', // 商家首页信息
  'REGION': api + 'movieApi/tool/v2/findRegionList', // 商家首页信息
  'DETAIL': api + 'movieApi/movie/v2/findMoviesDetail?movieId=', // 商家首页信息
};
