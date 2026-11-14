-- Roblox FPS Booster - Configuração
-- Coloque este ModuleScript ao lado de FPSBooster.client.lua.

return {
    -- Aplica a otimização automaticamente ao iniciar.
    AutoApply = true,

    -- Desativa efeitos visuais locais que podem custar desempenho.
    DisableParticles = true,
    DisableTrailsAndBeams = true,
    DisableFireSmokeAndSparkles = true,
    DisablePostProcessing = true,
    DisableHighlights = true,

    -- Reduz o custo de sombras de peças quando a propriedade permitir.
    DisablePartShadows = true,

    -- Detecta objetos adicionados durante a partida e otimiza-os também.
    OptimizeNewDescendants = true,

    -- Texto do botão de controle.
    ButtonText = "FPS BOOST",
}
