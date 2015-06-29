var gulp = require('gulp'); 
var jasmine = require('gulp-jasmine'); 
var caminhoCodigoFonte = '**/controllers/*.js'; 
var caminhoSpecs = 'spec/controllers/*.js'; 
gulp.task('testar', function() { 
	gulp.src(caminhoSpecs).pipe(jasmine()); 
}); 
gulp.task('tdd-continuo', ['testar'], function() { 
	gulp.watch(caminhoCodigoFonte, ['testar']); 
}); 
process.on('uncaughtException', function(e) { 
	console.error(e.stack); 
});