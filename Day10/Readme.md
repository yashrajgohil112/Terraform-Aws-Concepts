# Day 10: Terraform Dynamic Blocks, Conditional Expressions, and Splat Expressions

## 📚 Topics Covered
- **Conditional Expressions** - Make decisions in your configurations
- **Dynamic Blocks** - Create flexible, repeatable nested blocks
- **Splat Expressions** - Extract values from lists efficiently

---

## 🎯 Learning Objectives

By the end of this lesson, you will:
1. Master conditional expressions for environment-based configurations
2. Use dynamic blocks to eliminate code duplication
3. Apply splat expressions to extract data from multiple resources
4. Understand when to use each expression type
5. Combine multiple expression types for powerful configurations
6. Write cleaner, more maintainable Terraform code

---

## 🔧 Expressions Explained

### 1. Conditional Expressions

**What it does:**  
Evaluates a condition and returns one of two values based on whether the condition is true or false.

**Syntax:**
```hcl
condition ? true_value : false_value
```

**How it works:**
- If `condition` is `true`, returns `true_value`
- If `condition` is `false`, returns `false_value`
- Similar to ternary operators in programming languages

**Use Cases:**
- ✅ Choose instance types based on environment (dev vs prod)
- ✅ Enable/disable monitoring based on configuration
- ✅ Select different AMIs based on region
- ✅ Set different resource counts for environments
- ✅ Apply environment-specific tags

**Benefits:**
- ✅ Single configuration for multiple environments
- ✅ Reduces code duplication
- ✅ Makes environment differences explicit
- ✅ Simplifies configuration management
- ✅ Easy to understand and maintain

**When to use:**
- ✅ Environment-specific configurations
- ✅ Feature flags (enable/disable features)
- ✅ Conditional resource creation
- ✅ Region-specific settings
- ✅ Cost optimization (smaller resources in dev)

**When NOT to use:**
- ❌ Complex logic with many conditions (use locals instead)
- ❌ When separate environment files are clearer
- ❌ When all environments should be identical

---
