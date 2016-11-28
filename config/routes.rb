Rails.application.routes.draw do
  get 'reports/agents/topfive', to: "agents#topfive"
  get 'reports/agents/topfivebyrating', to: "agents#topfivebyrating"
  get 'reports/agents/topagent', to: "agents#topagentrating"
  get 'reports/agents/topagentprice', to: "agents#topagentprice"
end