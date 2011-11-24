//
//  main.cpp
//  OpenGL1
//
//  Created by jinwoo choi on 11. 10. 20..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//

#include <iostream>
#include <GLUT/glut.h>

void MyDisplay2();

void MyDisplay2() { // resize 해도 viewport는 300x300
    glClear(GL_COLOR_BUFFER_BIT);
    glViewport(0, 0, 300, 300); // x, y, width, height, 원점이 좌하단, 수학적 좌표계
    glColor3f(1.0, 1.0, 1.0); // white
    glBegin(GL_POLYGON);
    glVertex3f(-0.5, -0.5, 0.0);
    glVertex3f(0.5, -0.5, 0.0);
    glVertex3f(0.5, 0.5, 0.0);
    glVertex3f(-0.5, 0.5, 0.0);
    glEnd();
    glFlush();
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_RGB);
    glutInitWindowSize(300, 300);   // 300x300
    glutInitWindowPosition(0, 0);   // x, y 원점은 좌상단, 윈도우 좌표계
    glutCreateWindow("OpenGL Drawing Example");
    glClearColor(0.0, 0.0, 0.0, 1.0); // R-G-B-Alpha
    glMatrixMode(GL_PROJECTION);  // projection은 나중에...
    glLoadIdentity();
    glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0);
    glutDisplayFunc(MyDisplay2);
    glutMainLoop();
    return 0;
}