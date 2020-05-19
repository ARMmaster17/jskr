var app = angular.module('jskr', ['ngSanitize']);
app.controller('jskr-ctl', function($scope, $http) {
    $http.get("postings/next").then(function(response) {
        $scope.title = response.data.title;
        $scope.company = response.data.company;
        $scope.source = response.data.source;
        $scope.description = response.data.description;
        $scope.scorepos = response.data.description.match(/tag-level-3/g).length;
        $scope.scoremid = response.data.description.match(/tag-level-1/g).length;
        $scope.scoreneg = response.data.description.match(/tag-level--3/g).length;
        $scope.url = response.data.url;
        $scope.score = response.data.score;
    });
});

var app2 = angular.module('keywordform', ['']);
app2.controller('kctl', function($scope, $http) {
    $http.post('/keyword/new', {word: })
});