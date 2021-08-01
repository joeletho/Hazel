#include "SandboxApp.h"

#include "imgui/imgui.h"

#include <glm/gtc/matrix_transform.hpp> // for glm::translate

ExampleLayer::ExampleLayer()
        : Layer("Example"), m_Camera(-1.6f, 1.6f, -0.9f, 0.9), m_CameraPosition(0.0f) {

    m_VertexArray.reset(Hazel::VertexArray::Create());

    float vertices[3 * 7] = {
            -0.5f, -0.5f, 0.0f, 0.8f, 0.2f, 0.8f, 1.0f, // Left side of the screen
            0.5f, -0.5f, 0.0f, 0.2f, 0.3f, 0.8f, 1.0f,// Right side of the screen
            0.0f, 0.5f, 0.0f, 0.8f, 0.8f, 0.2f, 1.0f // Top of screen
    };

    std::shared_ptr<Hazel::VertexBuffer> vertexBuffer;
    vertexBuffer.reset(Hazel::VertexBuffer::Create(vertices, sizeof(vertices)));
    Hazel::BufferLayout layout = {
            {Hazel::ShaderDataType::Float3, "a_Position"},
            {Hazel::ShaderDataType::Float4, "a_Color"}
    };
    vertexBuffer->SetLayout(layout);
    m_VertexArray->AddVertexBuffer(vertexBuffer);

    uint32_t indices[3] = {0, 1, 2};
    std::shared_ptr<Hazel::IndexBuffer> indexBuffer;
    indexBuffer.reset(Hazel::IndexBuffer::Create(indices, sizeof(indices) / sizeof(uint32_t)));
    m_VertexArray->SetIndexBuffer(indexBuffer);

    m_SquareVA.reset(Hazel::VertexArray::Create());

    float squareVertices[3 * 4] = {
            -0.5f, -0.5f, 0.0f,
            0.5f, -0.5f, 0.0f,
            0.5f, 0.5f, 0.0f,
            -0.5f, 0.5f, 0.0f
    };

    std::shared_ptr<Hazel::VertexBuffer> squareVB;
    squareVB.reset(Hazel::VertexBuffer::Create(squareVertices, sizeof(squareVertices)));
    squareVB->SetLayout({{Hazel::ShaderDataType::Float3, "a_Position"}});
    m_SquareVA->AddVertexBuffer(squareVB);

    uint32_t squareIndices[6] = {0, 1, 2, 2, 3, 0};

    std::shared_ptr<Hazel::IndexBuffer> squareIB;
    squareIB.reset(Hazel::IndexBuffer::Create(squareIndices, sizeof(squareIndices) / sizeof(uint32_t)));
    m_SquareVA->SetIndexBuffer(squareIB);

    // Provide source code to OpenGL
    // `R` (raw_characters) precursor allows you to write multi-line string
    /** @param a_Position the position of @vertices
     * adding to a_Position will change the location of vertices */
    std::string vertexSrc = R"(
            #version 330 core

            layout(location = 0) in vec3 a_Position;
            layout(location = 1) in vec4 a_Color;

            uniform mat4 u_ViewProjection;
            uniform mat4 u_Transform;

            out vec3 v_Position;
            out vec4 v_Color;

            void main() {
                v_Position = a_Position;
                v_Color = a_Color;
                gl_Position =  u_ViewProjection * u_Transform * vec4(a_Position, 1.0);
            }
        )";

    // (1.0f, 0.0f, 0.0f) == Red
    // (1.0f, 0.5f, 0.15f) == Orange
    std::string fragmentSrc = R"(
            #version 330 core

            layout(location = 0) out vec4 color;

            in vec3 v_Position;
            in vec4 v_Color;

            void main() {
                color = vec4(v_Position * 0.5 + 0.5, 1.0); // This moves color range from [-1,1] to [0,1] range
                color = v_Color;
            }
        )";

    // Use std::reset to reset the shader
    m_Shader.reset(new Hazel::Shader(vertexSrc, fragmentSrc));

    std::string blueShaderVertexSrc = R"(
            #version 330 core

            layout(location = 0) in vec3 a_Position;

            uniform mat4 u_ViewProjection;
            uniform mat4 u_Transform;

            out vec3 v_Position;

            void main() {
                v_Position = a_Position;
                gl_Position =  u_ViewProjection * u_Transform * vec4(a_Position, 1.0);
            }
        )";

    // (1.0f, 0.0f, 0.0f) == Red
    // (1.0f, 0.5f, 0.15f) == Orange
    std::string blueShaderFragmentSrc = R"(
            #version 330 core

            layout(location = 0) out vec4 color;

            in vec3 v_Position;

            void main() {
                color = vec4(0.2, 0.3, 0.8, 1.0);
            }
        )";

    // Use std::reset to reset the shader
    m_BlueShader.reset(new Hazel::Shader(blueShaderVertexSrc, blueShaderFragmentSrc));
}

void ExampleLayer::OnUpdate(Hazel::Timestep ts) {
    HZ_TRACE("Delta time: {0}s ({1}ms)", ts.GetSeconds(), ts.GetMilliseconds());

    if (Hazel::Input::IsKeyPressed(HZ_KEY_LEFT)) {
        m_CameraPosition.x += m_CameraMoveSpeed * ts;
    } else if (Hazel::Input::IsKeyPressed(HZ_KEY_RIGHT)) {
        m_CameraPosition.x -= m_CameraMoveSpeed * ts;
    }
    if (Hazel::Input::IsKeyPressed(HZ_KEY_DOWN)) {
        m_CameraPosition.y += m_CameraMoveSpeed * ts;
    } else if (Hazel::Input::IsKeyPressed(HZ_KEY_UP)) {
        m_CameraPosition.y -= m_CameraMoveSpeed * ts;
    }
    if (Hazel::Input::IsKeyPressed(HZ_KEY_A)) {
        m_CameraRotation -= m_CameraRotationSpeed * ts;
    } else if (Hazel::Input::IsKeyPressed(HZ_KEY_D)) {
        m_CameraRotation += m_CameraRotationSpeed * ts;
    }

    // Reset camera
    if (Hazel::Input::IsKeyPressed(HZ_KEY_SPACE)) {
        m_CameraPosition.x = 0.0f;
        m_CameraPosition.y = 0.0f;
        m_CameraRotation = 0.0f;
    }

    Hazel::RenderCommand::GetError(); // Print any errors
    Hazel::RenderCommand::SetClearColor({0.2f, 0.1f, 0.2f, 1});
    Hazel::RenderCommand::Clear();

    m_Camera.SetPosition(m_CameraPosition);
    m_Camera.SetRotation(m_CameraRotation);

    Hazel::Renderer::BeginScene(m_Camera);

    glm::mat4 scale = glm::scale(glm::mat4(1.0f), glm::vec3(0.1f));

    // Create square grid map
    for (int y = -10; y < 10; ++y) {
        for (int x = -10; x < 10; ++x) {
            glm::vec3 pos(x * 0.11f, y * 0.11f, 0.0f);
            glm::mat4 transform = glm::translate(glm::mat4(1.0f), pos) * scale;
            Hazel::Renderer::Submit(m_BlueShader, m_SquareVA, transform);
        }
    }
    Hazel::Renderer::Submit(m_Shader, m_VertexArray);

    Hazel::Renderer::EndScene();
}

class Sandbox : public Hazel::Application {
public:
    Sandbox() {
        PushLayer(new ExampleLayer());
    }

    ~Sandbox() {}
};

Hazel::Application *Hazel::CreateApplication() {
    return new Sandbox();
}