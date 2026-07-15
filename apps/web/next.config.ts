import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    loader: "cloudinary",
    path: "https://res.cloudinary.com/r9f9o3jm/image/upload/",
  },
  outputFileTracingExcludes: {
    "*": [
      "**/node_modules/three/**/*",
      "**/node_modules/@react-three/**/*",
      "**/node_modules/exceljs/**/*",
      "**/node_modules/jspdf/**/*",
      "**/node_modules/jspdf-autotable/**/*",
      "**/node_modules/xlsx/**/*",
      "**/node_modules/xlsx-js-style/**/*",
    ],
  },
  experimental: {
    optimizePackageImports: ["lucide-react"],
  },
};

export default nextConfig;
