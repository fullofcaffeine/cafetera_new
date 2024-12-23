# Cafetera.io v0.1-alpha Specification

## Overview

Cafetera is a platform for quickly building and shipping online businesses. It provides a unified way to manage and extend online business applications through a modular "bean" system.

## Core Components

### Beans

Standalone packages providing specific functionality:

- **UI/Theming Bean**

  - TailwindCSS/Bootstrap base
  - Common layouts and patterns
  - Responsive components
  - React + LiveView integration

- **Scraper Bean**

  - Built with Playwright
  - Common scraping patterns
  - Configurable rules
  - Data pipeline integration

- **LLM Bean**

  - Self-hosted LLM deployment
  - API abstraction layer
  - Multiple model support
  - Cloud provider integration (DO/AWS)

- **GenerativeAI Bean**
  - Image generation (Stable Diffusion)
  - API integration
  - Resource management
  - GPU optimization

### Bean System

Beans follow a feature-based composition:

- Each bean defines:
  - Schema/DB changes
  - Business logic
  - API endpoints
  - UI components
  - Infrastructure requirements
  - Assets + deployment recipes

Goals:

- Easy creation of new beans
- Clear dependency management
- Granular feature control
- Simplified testing
- Maximum reusability

## Architecture

### Core Components

1. **cafetera-hub**

   - Web interface
   - Dashboard & monitoring
   - Bean management
   - Asset pipeline
   - Cross-app data aggregation

2. **cafetera-core**

   - Bean system implementation
   - API abstractions
   - Infrastructure management
   - Database migrations
   - Security & auth

3. **cafetera-cli**
   - Command line interface
   - Project scaffolding
   - Bean management
   - Deployment utilities

### API System

Multi-protocol API support:

- REST endpoints
- GraphQL
- tRPC (Elixir<>TS)
- Internal Elixir API

Key aspects:

- Source of truth in Elixir
- Auto-generated client SDKs
- Bean-specific resources under namespaces
- Easy integration points for beans

## v0.1 Focus Areas

1. Bean System Core

   - Basic bean loading
   - Feature dependencies
   - Resource management

2. Core Beans

   - UI/Theming (first-party)
   - Basic LLM integration

3. Project Management

   - Project creation
   - Basic deployment
   - SSL/DNS handling

4. Developer Experience
   - CLI tooling
   - Documentation
   - Example beans
