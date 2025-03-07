import Foundation

public struct Professional: Decodable {
    public var id: Int
    public var name: String
    public var rating: Int
    public var ratingCount: Int
    public var languages: [String]
    public var expertise: [String]
    public var profileImage: String
    public var aboutMe: String?  // Agora opcional

    public init(
        id: Int,
        name: String,
        rating: Int,
        ratingCount: Int,
        languages: [String],
        expertise: [String],
        profileImage: String,
        aboutMe: String?
    ) {
        self.id = id
        self.name = name
        self.rating = rating
        self.ratingCount = ratingCount
        self.languages = languages
        self.expertise = expertise
        self.profileImage = profileImage
        self.aboutMe = aboutMe
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case rating
        case ratingCount = "rating_count"
        case languages
        case expertise
        case profileImage = "profile_picture_url"
        case aboutMe = "about_me"
    }
}

extension Professional {
    public static var mockProfessionals: [Professional] {
        return [
            Professional(
                id: 1,
                name: "Dr. Ana Silva",
                rating: 5,
                ratingCount: 120,
                languages: ["Português", "Inglês"],
                expertise: ["Nutrição Esportiva", "Emagrecimento"],
                profileImage: "https://example.com/image1.jpg",
                aboutMe: "Especialista em nutrição esportiva há mais de 10 anos. Trabalha com atletas de diversas modalidades, desenvolvendo planos nutricionais personalizados para melhorar o desempenho e a recuperação. Seu foco está na otimização da alimentação para maximizar resultados."
            ),
            Professional(
                id: 2,
                name: "Dr. João Oliveira",
                rating: 4,
                ratingCount: 80,
                languages: ["Português", "Espanhol"],
                expertise: ["Nutrição Clínica", "Dieta Mediterrânea"],
                profileImage: "https://example.com/image2.jpg",
                aboutMe: "Apaixonado por dietas equilibradas e saúde holística, João dedica-se a ajudar seus pacientes a encontrar o equilíbrio entre nutrição e bem-estar, utilizando princípios da dieta mediterrânea para promover um estilo de vida saudável e sustentável."
            ),
            Professional(
                id: 3,
                name: "Dra. Maria Santos",
                rating: 4,
                ratingCount: 95,
                languages: ["Português", "Francês"],
                expertise: ["Nutrição Funcional", "Diabetes"],
                profileImage: "https://example.com/image3.jpg",
                aboutMe: "Atendimento personalizado focado em nutrição funcional, ajudando pacientes a controlarem doenças crônicas como diabetes através de uma abordagem nutricional adaptada às suas necessidades individuais."
            ),
            Professional(
                id: 4,
                name: "Dr. Pedro Lima",
                rating: 5,
                ratingCount: 200,
                languages: ["Português"],
                expertise: ["Nutrição Esportiva", "Hipertrofia"],
                profileImage: "https://example.com/image4.jpg",
                aboutMe: "Especialista em nutrição para atletas de alta performance, Pedro auxilia esportistas na maximização da força e resistência através de planos nutricionais específicos para ganho de massa muscular e melhora do desempenho físico."
            ),
            Professional(
                id: 5,
                name: "Dra. Carolina Ferreira",
                rating: 3,
                ratingCount: 50,
                languages: ["Português", "Inglês"],
                expertise: ["Nutrição Infantil", "Alergias Alimentares"],
                profileImage: "https://example.com/image5.jpg",
                aboutMe: "Foco na alimentação saudável para crianças, auxiliando pais a estruturarem hábitos alimentares equilibrados desde a infância e orientando sobre dietas especiais para crianças com alergias alimentares."
            ),
            Professional(
                id: 6,
                name: "Dr. Ricardo Alves",
                rating: 4,
                ratingCount: 130,
                languages: ["Português", "Espanhol"],
                expertise: ["Obesidade", "Dieta Low-Carb"],
                profileImage: "https://example.com/image6.jpg",
                aboutMe: "Ajudo pacientes a atingir um peso saudável de forma sustentável, utilizando abordagens como a dieta low-carb para promover a perda de gordura e a manutenção de um metabolismo equilibrado."
            ),
            Professional(
                id: 7,
                name: "Dra. Luana Costa",
                rating: 5,
                ratingCount: 180,
                languages: ["Português", "Italiano"],
                expertise: ["Saúde da Mulher", "Gestação Saudável"],
                profileImage: "https://example.com/image7.jpg",
                aboutMe: "Especialista em nutrição para gestantes e lactantes, Luana trabalha para garantir que mães e bebês recebam os nutrientes essenciais para um desenvolvimento saudável durante todas as fases da gestação e amamentação."
            ),
            Professional(
                id: 8,
                name: "Dr. Eduardo Mendes",
                rating: 3,
                ratingCount: 60,
                languages: ["Português", "Inglês"],
                expertise: ["Reeducação Alimentar", "Dieta Plant-Based"],
                profileImage: "https://example.com/image8.jpg",
                aboutMe: "Defensor de uma alimentação mais natural e equilibrada, Eduardo ajuda seus pacientes a adotarem um estilo de vida saudável através da reeducação alimentar e de dietas à base de plantas."
            ),
            Professional(
                id: 9,
                name: "Dra. Beatriz Rocha",
                rating: 4,
                ratingCount: 75,
                languages: ["Português", "Alemão"],
                expertise: ["Nutrição Clínica", "Prevenção de Doenças"],
                profileImage: "https://example.com/image9.jpg",
                aboutMe: "Uso da nutrição para prevenir doenças e melhorar qualidade de vida, focando em estratégias alimentares que fortalecem o sistema imunológico e promovem o bem-estar a longo prazo."
            ),
            Professional(
                id: 10,
                name: "Dr. Marcelo Souza",
                rating: 5,
                ratingCount: 210,
                languages: ["Português", "Francês"],
                expertise: ["Desempenho Esportivo", "Suplementação"],
                profileImage: "https://example.com/image10.jpg",
                aboutMe: "Consultoria especializada em nutrição para atletas profissionais, ajudando na escolha adequada de suplementos e estratégias nutricionais para maximizar a performance esportiva e recuperação pós-treino."
            )
        ]
    }
}
