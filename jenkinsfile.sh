#!/bin/bash
# This is pipeline script


pipeline{
    agent any
    stages{
        stage("Check out the code from GitHub repository"){
            steps{
                git url:"https://github.com/ShailendraNarayanSwain/MaveJob.git"
            }
        }
        stage("code-compile"){
            steps{
                sh "mvn compile"
            }
        }
        stage("code-test"){
            steps{
                sh "mvn test"
            }
        }
        stage("code-QA"){
            steps{
                sh "mvn pmd:pmd"
            }
        }
        stage("code-package"){
            steps{
                sh "mvn package"
            }
        }
    }
}
