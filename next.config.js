module.exports = {
    eslint: {
      dirs: ["src"], // Run ESLint on the 'src' directory during production builds (next build)
      ignoreDuringBuilds: true,
    },
    reactStrictMode: true,
};