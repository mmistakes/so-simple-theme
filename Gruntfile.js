'use strict';
module.exports = function(grunt) {

  grunt.initConfig({
    jshint: {
      options: {
        jshintrc: '.jshintrc'
      },
      all: [
        'Gruntfile.js',
        'assets/js/*.js',
        'assets/js/plugins/*.js',
        '!assets/js/scripts.min.js'
      ]
    },
    sass: {
      dist: {
        options: {
          sourcemap: false,
          style: 'compressed',
          precision: '2',
          compass: false,
          cache: 'delete/'
        },
        files: {
          'assets/css/main.min.css':'assets/scss/main.scss'
        }
      }
    },
    uglify: {
      dist: {
        files: {
          'assets/js/scripts.min.js': [
            'assets/js/plugins/*.js',
            'assets/js/_*.js'
          ]
        }
      }
    },
    imagemin: {
      dist: {
        options: {
          optimizationLevel: 7,
          progressive: true
        },
        files: [{
          expand: true,
          cwd: 'images/',
          src: '{,*/}*.{png,jpg,jpeg}',
          dest: 'images/'
        }]
      }
    },
    svgmin: {
      dist: {
        files: [{
          expand: true,
          cwd: 'images/',
          src: '{,*/}*.svg',
          dest: 'images/'
        }]
      }
    },
    watch: {
      sass: {
        files: [
          'assets/scss/*.scss'
        ],
        tasks: ['sass']
      },
      js: {
        files: [
          '<%= jshint.all %>'
        ],
        tasks: ['uglify']
      }
    },
    clean: {
      dist: [
        'assets/css/main.min.css',
        'assets/js/scripts.min.js'
      ]
    }
  });

  // Load tasks
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-svgmin');

  // Register tasks
  grunt.registerTask('default', [
    'clean',
    'sass',
    'uglify',
    'imagemin',
    'svgmin'
  ]);
  grunt.registerTask('dev', [
    'watch'
  ]);

};