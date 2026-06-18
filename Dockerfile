FROM node:20-alpine

# Set folder kerja di dalam container
WORKDIR /app

# Install pnpm secara global langsung lewat npm bawaan node
RUN npm install -g pnpm@9.15.9

# Copy package.json dan lockfile untuk optimasi cache
COPY package.json pnpm-lock.yaml* pnpm-workspace.yaml* ./

# Install seluruh dependensi project
RUN pnpm install

# Copy seluruh sisa kode aplikasi Anda
COPY . .

# Jalankan build Next.js
RUN pnpm run build

# Buka port (biasanya Next.js pakai 3000, nanti di-mapping otomatis oleh Easypanel)
EXPOSE 3000

# Perintah untuk menghidupkan website Anda
CMD ["pnpm", "start"]
