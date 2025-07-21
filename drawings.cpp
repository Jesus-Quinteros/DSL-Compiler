#include "drawings.hpp"
#include <iostream>

static std::vector<sf::Text> letras;
static std::vector<sf::Text> numeros;
static std::vector<sf::CircleShape> circulos;
static std::vector<sf::RectangleShape> cuadrados;
static std::vector<sf::CircleShape> triangulos;

static sf::Font font;
static const float ESPACIADO_X = 120.0f;
static const float POS_Y = 150.0f;

void dibujarLetra(char letra) {
  if (!font.openFromFile("fonts/arial.ttf")) {
    std::cerr << "No se pudo cargar la fuente.\n";
    return;
  }

  sf::Text text(font);
  text.setString(std::string(1, letra));
  text.setCharacterSize(100);
  text.setFillColor(sf::Color::Black);

  float posX = 50 + letras.size() * ESPACIADO_X;
  text.setPosition({posX, POS_Y * 0});
  letras.push_back(text);
}

void dibujarNumero(char numero) {
  if (!font.openFromFile("fonts/arial.ttf")) {
    std::cerr << "No se pudo cargar la fuente.\n";
    return;
  }

  sf::Text text(font);
  text.setString(std::string(1, numero));
  text.setCharacterSize(100);
  text.setFillColor(sf::Color::Black);

  float posX = 50 + numeros.size() * ESPACIADO_X;
  text.setPosition({posX, POS_Y * 1});
  numeros.push_back(text);
}

void dibujarFigura(const std::string& figura) {
  if (figura == "circulo") {
    sf::CircleShape circle(50);
    circle.setFillColor(sf::Color::Green);
    float posX = 50 + circulos.size() * ESPACIADO_X;
    circle.setPosition({posX, POS_Y * 2});
    circulos.push_back(circle);
  } else if (figura == "cuadrado") {
    sf::RectangleShape cuadrado({100, 100});
    cuadrado.setFillColor(sf::Color::Yellow);
    float posX = 50 + cuadrados.size() * ESPACIADO_X;
    cuadrado.setPosition({posX, POS_Y * 3});
    cuadrados.push_back(cuadrado);
  } else if (figura == "triangulo") {
    sf::CircleShape triangulo(60, 3);
    triangulo.setFillColor(sf::Color::Blue);
    float posX = 50 + triangulos.size() * ESPACIADO_X;
    triangulo.setPosition({posX, POS_Y * 4});
    triangulos.push_back(triangulo);
  }
}

void mostrarVentana() {
  sf::RenderWindow window(sf::VideoMode({800, 600}), "LetraMagica");
  window.setFramerateLimit(60);

  sf::View view = window.getDefaultView();

  const float moveSpeed = 20.0f;
  const float zoomFactor = 1.1f;

  bool arrastrandoAlgo = false;
  sf::Vector2f offset;
  sf::Text* letraSeleccionada = nullptr;
  sf::Text* numeroSeleccionado = nullptr;
  sf::CircleShape* circuloSeleccionado = nullptr;
  sf::RectangleShape* cuadradoSeleccionado = nullptr;
  sf::CircleShape* trianguloSeleccionado = nullptr;

  while (window.isOpen()) {
    while (std::optional event = window.pollEvent()) {
      if (event->is<sf::Event::Closed>()) {
        window.close();
      } else if (auto KeyPressed = event->getIf<sf::Event::KeyPressed>()) {
        switch (KeyPressed->scancode) {
          case sf::Keyboard::Scancode::Escape: window.close(); break;
          case sf::Keyboard::Scancode::W: view.move({0, -moveSpeed}); break;
          case sf::Keyboard::Scancode::S: view.move({0, moveSpeed}); break;
          case sf::Keyboard::Scancode::A: view.move({-moveSpeed, 0}); break;
          case sf::Keyboard::Scancode::D: view.move({moveSpeed, 0}); break;
          case sf::Keyboard::Scancode::Q: view.zoom(zoomFactor); break;
          case sf::Keyboard::Scancode::E: view.zoom(1.0f / zoomFactor); break;
          default: break;
        }
      } else if (auto buttonPressed = event->getIf<sf::Event::MouseButtonPressed>()) {
        if (buttonPressed->button == sf::Mouse::Button::Left) {
          sf::Vector2f mouseWorld = window.mapPixelToCoords(sf::Mouse::getPosition(window));
          
          if (!arrastrandoAlgo) {
            for (auto& letra : letras) {
              if (letra.getGlobalBounds().contains(mouseWorld)) {
                arrastrandoAlgo = true;
                letraSeleccionada = &letra;
                offset = mouseWorld - letra.getPosition();
                break;
              }
            }
          }
          
          if (!arrastrandoAlgo) {
            for (auto& numero : numeros) {
              if (numero.getGlobalBounds().contains(mouseWorld)) {
                arrastrandoAlgo = true;
                numeroSeleccionado = &numero;
                offset = mouseWorld - numero.getPosition();
                break;
              }
            }
          }

          if (!arrastrandoAlgo) {
            for (auto& figura : circulos) {
              if (figura.getGlobalBounds().contains(mouseWorld)) {
                arrastrandoAlgo = true;
                circuloSeleccionado = &figura;
                offset = mouseWorld - figura.getPosition();
                break;
              }
            }
          }
          if (!arrastrandoAlgo) {
            for (auto& figura : cuadrados) {
              if (figura.getGlobalBounds().contains(mouseWorld)) {
                arrastrandoAlgo = true;
                cuadradoSeleccionado = &figura;
                offset = mouseWorld - figura.getPosition();
                break;
              }
            }
          }
          if (!arrastrandoAlgo) {
            for (auto& figura : triangulos) {
              if (figura.getGlobalBounds().contains(mouseWorld)) {
                arrastrandoAlgo = true;
                trianguloSeleccionado = &figura;
                offset = mouseWorld - figura.getPosition();
                break;
              }
            }
          }
        }   
      } else if (auto buttonReleased = event->getIf<sf::Event::MouseButtonReleased>()) {
        if (buttonReleased->button == sf::Mouse::Button::Left) {
          arrastrandoAlgo = false;
          letraSeleccionada = nullptr;
          numeroSeleccionado = nullptr;
          circuloSeleccionado = nullptr;
          cuadradoSeleccionado = nullptr;
          trianguloSeleccionado = nullptr;
        }
      } else if (event->getIf<sf::Event::MouseMoved>()) {
        if (arrastrandoAlgo) {
          sf::Vector2f mouseWorld = window.mapPixelToCoords(sf::Mouse::getPosition(window));
          if (letraSeleccionada)
            letraSeleccionada->setPosition(mouseWorld - offset);
          else if (numeroSeleccionado)
            numeroSeleccionado->setPosition(mouseWorld - offset);
          else if (circuloSeleccionado)
            circuloSeleccionado->setPosition(mouseWorld - offset);
          else if (cuadradoSeleccionado)
            cuadradoSeleccionado->setPosition(mouseWorld - offset);
          else if (trianguloSeleccionado)
            trianguloSeleccionado->setPosition(mouseWorld - offset);
        }
      }
    }

    window.setView(view);
    window.clear(sf::Color::White);

    for (const auto& letra : letras) window.draw(letra);
    for (const auto& numero : numeros) window.draw(numero);
    for (const auto& figura : circulos) window.draw(figura);
    for (const auto& figura : cuadrados) window.draw(figura);
    for (const auto& figura : triangulos) window.draw(figura);

    window.display();
  }
}
