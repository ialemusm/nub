/**
 * Basic Use.
 * by Jean Pierre Charalambos.
 * 
 * This example illustrates a direct approach to use frames by Scene proper
 * instantiation.
 */

import frames.input.*;
import frames.input.event.*;
import frames.processing.*;

Scene scene;
//Choose P2D or P3D
String renderer = P2D;

Shape shape;
float length = 100;
PGraphics pg;

void setup() {
  size(800, 800, renderer);
  rectMode(CENTER);
  scene = new Scene(this);
  scene.setRadius(200);

  shape = new Shape(scene) {
    @Override
    public void set(PGraphics pg) {
      pg.fill(255, 0, 255);
      pg.rect(0, 0, length, length);
    }

    @Override
    public void interact(frames.input.Event event) {
      Shortcut left = new Shortcut(PApplet.LEFT);
      Shortcut right = new Shortcut(PApplet.RIGHT);
      Shortcut wheel = new Shortcut(processing.event.MouseEvent.WHEEL);
      if (left.matches(event.shortcut()))
        rotate(event);
      if (right.matches(event.shortcut()))
        screenTranslate(event);
      if (event.shortcut().matches(wheel))
        scale(event);
    }
  };

  scene.setDefaultNode(shape);
  scene.fitBallInterpolation();
}

void draw() {
  background(0);
  scene.traverse();
}